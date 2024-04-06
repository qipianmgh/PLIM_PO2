% Here's the list of methods that make up the interface to GalvoClass:
classdef GalvoClass < handle  
    properties 
        AO_Channel
        AO_Handle
        AO_UpdateRate
        AO_ConversionRatio
        BidirectionScan
        
        VoltRangeX
        VoltRangeY
        DistPerVoltList
        DistPerVolt
        FOV
        PixelX
        PixelY
        SquFOV_Status
        VoltOffsetX
        VoltOffsetY
        ScanInX
        ScanOutX 
        ScanInY
        ScanOutY
        ScanMode
        FillFraction
        GalvoSettleTime
        GalvoFlybackTime
        GalvoInertiaTime
        
        ExcPeriod
        NumCycles
        PixelDwellTime
        AcqDelayTime
        AddPixelStatus
        SelectRectROI_Status
        SelectCircROI_Status
        ActivePixelStatus
        AddPixelMode
        PO2Pos
        PO2PosList
        PO2Vol
                
        WaveformX
        WaveformY
        WaveformRampInd
        WaveformEomTrig
        WavDisplayMode
        DisplayLength
        FrameLength
        FrameRetraceLength
        LineLength
        PixelAcqLength
        PixelTotalLength
        ActivePixelInd
    end
  
    methods
        
        function obj = GalvoClass(obj)
            obj.AO_Channel = '/PXI1Slot3/ao0:1';  %%% ao0 ao1 channel X Y
            obj.AO_UpdateRate = double(5e5);
            obj.AO_ConversionRatio = double(2^16/20);  %%%  volt to DAC input +-/10V range
            obj.BidirectionScan = logical(0);    %%%  0: Uni-direction 1: Bi-direction
            obj.VoltRangeX = double(7.674);
            obj.VoltRangeY = double(7.674);
            obj.DistPerVoltList = [687.3646/7.674 549.8917/7.674 3436.823/7.674];
            obj.DistPerVolt = [];
            obj.FOV = [];
            obj.PixelX = double(512);
            obj.PixelY = double(512);
            obj.SquFOV_Status = 1;
            obj.VoltOffsetX = double(0);
            obj.VoltOffsetY = double(0);
            obj.ScanInX = double(0);
            obj.ScanOutX = double(0);
            obj.ScanInY = double(0);
            obj.ScanOutY = double(0);
            obj.ScanMode = uint8(0);   %0: Scan; 1: Galvo Multi-Pts
            obj.FillFraction = 0.9;
            obj.GalvoSettleTime = double(302e-6);  %%% uint: s
            obj.GalvoFlybackTime = double(822e-6); %%% uint: s
            obj.GalvoInertiaTime = double(180e-6); %%% uint: s
            
            obj.ExcPeriod = double(300e-6);
            obj.NumCycles = double(1);
            obj.PixelDwellTime = double(4e-6);  %%% s
            obj.AcqDelayTime = 143.15e-6;       %%% s, was 145 
            obj.WaveformX = [];
            obj.WaveformY = [];
            obj.WaveformRampInd = [];
            obj.AddPixelStatus = logical(0);      %%% 0: No 1: Yes
            obj.SelectRectROI_Status = logical(0);    %%% 0: No 1: Yes
            obj.SelectCircROI_Status = logical(0);    %%% 0: No 1: Yes
            obj.ActivePixelStatus = logical(0);   %%% 0: No 1: Yes
            obj.AddPixelMode = uint8(0);          %%% 0: No 1: Add Pixel 2: ROI 3: Modify Current pO2Pos 8: Pan Move  
            obj.PO2Pos = double([]);
            obj.PO2PosList = double([]);
            obj.PO2Vol = double([]);
            
            obj.AO_Handle = uint64(0);
            obj.DisplayLength = uint64(0);
            obj.WavDisplayMode = logical(0);   %%% 0: Galvo waveform display; 1: StageFZ waveform display 
            obj.FrameLength = [];
            obj.FrameRetraceLength = [];
            obj.LineLength = [];
            obj.PixelAcqLength = [];
            obj.PixelTotalLength = [];
            obj.ActivePixelInd = [];
        end
               
        function InitGalvo(obj)    %  Clock, Initial value, Terminal connection.
            obj.AO_Handle = DAQCreateTask('GalvoControl');
            DAQCreateAOVoltChan(obj.AO_Handle,obj.AO_Channel,[-10,10]);
            DAQSetRefClkSrc(obj.AO_Handle, '/PXI1Slot3/PXIe_Clk100'); 
            DAQSetStartTrigType(obj.AO_Handle, DAQmx_Val_None);
            DAQCfgSampClkTimingFiniSamps(obj.AO_Handle,' ',obj.AO_UpdateRate, 2);
            DAQWriteAnalogF64(obj.AO_Handle, 2, 1, zeros(4,1));
            DAQStopTask(obj.AO_Handle);
        end
        
        function GenerateWaveform(obj, DaqMode, DaqRepeat, AI_Rate)   %%%  DaqRepeat & AI_Rate only for DaqMode 0 & 1
            GalvoWaitbar = waitbar(0,'Generating Waveform !');
            pause(0.2);
            VoltSequenceX = [];
            VoltSequenceY = [];
            VoltSequenceRampInd = [];
            switch DaqMode
                case {0, 1}    %%%% Angiogram SurveyScan & Stack
                   %%% Define Range and Offset 
                   if obj.BidirectionScan ==0   %%%%%   Uni-direction    
                      RangeArrayX = obj.VoltRangeX*ones(1,obj.PixelY);
                      OffsetArrayX = zeros(1,obj.PixelY); 
                   else                         %%%%%  Bi-direction    
                      RangeArrayX = zeros(1, obj.PixelY);
                      OffsetArrayX = zeros(1, obj.PixelY);
                      RangeArrayX(1:2:obj.PixelY) = obj.VoltRangeX;
                      RangeArrayX(2:2:obj.PixelY) = -obj.VoltRangeX;
                      OffsetArrayX(1:2:obj.PixelY) = 0;
                      OffsetArrayX(2:2:obj.PixelY) = obj.VoltRangeX; 
                   end
                   if obj.PixelY==1
                      OffsetArrayY = obj.VoltRangeY/2;   
                   else
                      for i=1:obj.PixelY
                          OffsetArrayY(i) = obj.VoltRangeY/(obj.PixelY-1)*(i-1);     
                      end
                   end
                   RangeArrayX = repmat(RangeArrayX, [1 DaqRepeat]);
                   RangeArrayX = [RangeArrayX 0];   %%% X range 
                   OffsetArrayX = repmat(OffsetArrayX, [1 DaqRepeat]);
                   OffsetArrayX = [OffsetArrayX obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanOutX];  %%% X offset
                   RangeArrayY = zeros(1,obj.PixelY*DaqRepeat+1); %%%  Y range
                   OffsetArrayY = repmat(OffsetArrayY, [1 DaqRepeat]);
                   OffsetArrayY = [OffsetArrayY obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanOutY];   %%% Y offset
                  
                   MinRampPeriod = obj.PixelX*obj.PixelDwellTime;
                   MinRampLength = ceil(obj.PixelX*(obj.PixelDwellTime*obj.AO_UpdateRate));
                   SettleLength = ceil(obj.GalvoSettleTime*obj.AO_UpdateRate);
                   MinRetraceLength = ceil(obj.GalvoFlybackTime*obj.AO_UpdateRate);
                   AcqDelayLength = 0;
                   RetraceLength = max(MinRetraceLength,ceil(MinRampPeriod/obj.FillFraction*(1-obj.FillFraction)*obj.AO_UpdateRate));
                   if AI_Rate == 1e6
                      switch obj.AO_UpdateRate
                          case 5e5
                             SettleLength = max(ceil(SettleLength/2)*2,2);
                             RampLength = MinRampLength + SettleLength + AcqDelayLength;
                             LineLength = RampLength + RetraceLength;
                          case 8e5
                             RetraceLength = max(ceil(RetraceLength/4)*4,4);
                             SettleLength = max(ceil(SettleLength/4)*4,4);
                             RampLength = MinRampLength + SettleLength + AcqDelayLength;
                             LineLength = RampLength + RetraceLength;     
                      end
                   else   %%% AI_Rate == 1.25e6; Galvo.AO_UpdateRate = 5e5
                      RetraceLength = max(ceil(RetraceLength/2)*2,2);
                      SettleLength = max(ceil(SettleLength/2)*2,2);
                      RampLength = MinRampLength + SettleLength + AcqDelayLength;
                      LineLength = RampLength + RetraceLength;
                   end
                   %%% Frame Waveform
                   obj.FrameLength = obj.PixelY*LineLength*DaqRepeat + RetraceLength;
                   VoltSequenceX = zeros(obj.FrameLength,1);
                   VoltSequenceY = VoltSequenceX;
                   VoltSequenceRampInd = VoltSequenceX;
                   %%% Transition Waveform
                   TransitionX = zeros(RetraceLength,1);
                   TransitionY = zeros(RetraceLength,1);
                   TransitionX = GenRetraceWaveform(RetraceLength, MinRampLength, SettleLength, AcqDelayLength, 0,obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanInX, RangeArrayX(1), OffsetArrayX(1));
                   TransitionY = GenRetraceWaveform(RetraceLength, MinRampLength, SettleLength, AcqDelayLength, 0,obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanInY, RangeArrayY(1), OffsetArrayY(1));
                   TransitionX = int16(TransitionX*obj.AO_ConversionRatio);
                   TransitionY = int16(TransitionY*obj.AO_ConversionRatio);
                   LinearRampLine = zeros(LineLength,1);
                   LinearRampLine(ceil(0.5*SettleLength+AcqDelayLength)+1:ceil(0.5*SettleLength+AcqDelayLength)+1+MinRampLength) = 1;
                   for i=1:obj.PixelY*DaqRepeat
                       VoltSequenceX(RetraceLength+1+(i-1)*LineLength:RetraceLength+i*LineLength) = GenRampWaveform(RetraceLength, MinRampLength, SettleLength, AcqDelayLength, RangeArrayX(i),OffsetArrayX(i), RangeArrayX(i+1), OffsetArrayX(i+1));
                       VoltSequenceY(RetraceLength+1+(i-1)*LineLength:RetraceLength+i*LineLength) = GenRampWaveform(RetraceLength, MinRampLength, SettleLength, AcqDelayLength, RangeArrayY(i),OffsetArrayY(i), RangeArrayY(i+1), OffsetArrayY(i+1));
                       VoltSequenceRampInd(RetraceLength+1+(i-1)*LineLength:RetraceLength+i*LineLength) = LinearRampLine;
                   end
                   VoltSequenceX = int16(VoltSequenceX*obj.AO_ConversionRatio);
                   VoltSequenceX(1:length(TransitionX)) = TransitionX;
                   VoltSequenceX = int16((obj.VoltOffsetX-0.5*obj.VoltRangeX)*obj.AO_ConversionRatio)+VoltSequenceX;

                   VoltSequenceY = int16(VoltSequenceY*obj.AO_ConversionRatio);
                   VoltSequenceY(1:length(TransitionY)) = TransitionY;
                   VoltSequenceY = int16((obj.VoltOffsetY-0.5*obj.VoltRangeY)*obj.AO_ConversionRatio)+VoltSequenceY;
                  
                   obj.WaveformX = VoltSequenceX;
                   obj.WaveformY = VoltSequenceY;
                   obj.WaveformRampInd = VoltSequenceRampInd;
                   obj.DisplayLength = 2*LineLength;
                   obj.FrameRetraceLength = RetraceLength;
                   obj.LineLength = LineLength;
                   obj.PixelAcqLength = [];
                   obj.PixelTotalLength = [];  
                   clear VoltSequenceX
                   clear VoltSequenceY  
                   clear VoltSequenceRampInd
                case 2     %%%% pO2 SurveyScan (Pixel Line Frame)
                   EomExcLength = ceil(obj.ExcPeriod*obj.AO_UpdateRate);
                   PixelSettleLength = ceil(obj.GalvoSettleTime*obj.AO_UpdateRate);
                   AcqDelayLength = ceil(obj.AcqDelayTime*obj.AO_UpdateRate);
                   PixelAcqLength = (EomExcLength + AcqDelayLength)*obj.NumCycles;  
                   LineRetraceLength = ceil(obj.GalvoFlybackTime*obj.AO_UpdateRate);
                   %%% Define Range and Offset for Pixel X
                   if obj.PixelX==1
                      LineOffsetArrayX = obj.VoltRangeX/2;   
                   else
                      for i=1:obj.PixelX
                          LineOffsetArrayX(i) = obj.VoltRangeX/(obj.PixelX-1)*(i-1);     
                      end
                   end
                   LineOffsetArrayX = [LineOffsetArrayX obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanOutX];  
                   LineWaveformX = [];                                    
                   for i=1:obj.PixelX-1   
                       PixelSettleWaveform = GenPixelRetraceWaveform(PixelSettleLength, LineOffsetArrayX(i), LineOffsetArrayX(i+1));
                       LineWaveformX = [LineWaveformX; ones(PixelAcqLength,1)*LineOffsetArrayX(i); PixelSettleWaveform];    
                   end
                   LineRetraceWaveform = GenPixelRetraceWaveform(LineRetraceLength, LineOffsetArrayX(obj.PixelX), LineOffsetArrayX(1));
                   LineWaveformX_Normal = [LineWaveformX; ones(PixelAcqLength,1)*LineOffsetArrayX(obj.PixelX); LineRetraceWaveform];
                   LineRetraceWaveform_Return = GenPixelRetraceWaveform(LineRetraceLength, LineOffsetArrayX(obj.PixelX), LineOffsetArrayX(obj.PixelX+1));
                   LineWaveformX_Return = [LineWaveformX; ones(PixelAcqLength,1)*LineOffsetArrayX(obj.PixelX); LineRetraceWaveform_Return];
                   %%% Define Range and Offset for X, Y
                   if obj.PixelY==1
                      OffsetArrayY = obj.VoltRangeY/2;   
                   else
                      for i = 1:obj.PixelY
                          OffsetArrayY(i) = obj.VoltRangeY/(obj.PixelY-1)*(i-1);     
                      end
                   end
                   OffsetArrayY = [OffsetArrayY obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanOutY];  %%% Y offset
                   LineLength = obj.PixelX*PixelAcqLength + (obj.PixelX-1)*PixelSettleLength + LineRetraceLength;                
                   FrameLength = obj.PixelY*LineLength + LineRetraceLength;
                   VoltSequenceX = zeros(FrameLength,1);
                   VoltSequenceY = VoltSequenceX;
                   TransitionX = zeros(1,LineRetraceLength);
                   TransitionY = TransitionX;
                   TransitionX = GenPixelRetraceWaveform(LineRetraceLength, obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanInX, 0);
                   TransitionY = GenPixelRetraceWaveform(LineRetraceLength, obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanInY, OffsetArrayY(1));
                   TransitionX = int16(TransitionX*obj.AO_ConversionRatio);
                   TransitionY = int16(TransitionY*obj.AO_ConversionRatio);
                   for i=1:obj.PixelY
                       if i ~= obj.PixelY
                          VoltSequenceX((i-1)*LineLength+LineRetraceLength+1:i*LineLength+LineRetraceLength)= LineWaveformX_Normal;
                          VoltSequenceY((i-1)*LineLength+LineRetraceLength+1:i*LineLength+LineRetraceLength)= [OffsetArrayY(i)*ones(LineLength-LineRetraceLength,1); GenPixelRetraceWaveform(LineRetraceLength, OffsetArrayY(i), OffsetArrayY(i+1))];
                       else
                          VoltSequenceX((i-1)*LineLength+LineRetraceLength+1:i*LineLength+LineRetraceLength)= LineWaveformX_Return;
                          VoltSequenceY((i-1)*LineLength+LineRetraceLength+1:i*LineLength+LineRetraceLength)= [OffsetArrayY(i)*ones(LineLength-LineRetraceLength,1); GenPixelRetraceWaveform(LineRetraceLength, OffsetArrayY(i), OffsetArrayY(i+1))];   
                       end
                   end
                   VoltSequenceX = int16(VoltSequenceX*obj.AO_ConversionRatio);
                   VoltSequenceX(1:LineRetraceLength) = TransitionX;
                   VoltSequenceX = int16((obj.VoltOffsetX-0.5*obj.VoltRangeX)*obj.AO_ConversionRatio)+VoltSequenceX;

                   VoltSequenceY = int16(VoltSequenceY*obj.AO_ConversionRatio);
                   VoltSequenceY(1:LineRetraceLength) = TransitionY;
                   VoltSequenceY = int16((obj.VoltOffsetY-0.5*obj.VoltRangeY)*obj.AO_ConversionRatio)+VoltSequenceY;
                  
                   obj.WaveformX = VoltSequenceX;
                   obj.WaveformY = VoltSequenceY;
                   obj.DisplayLength = LineLength + LineRetraceLength;
                   obj.FrameRetraceLength = LineRetraceLength;
                   obj.LineLength = LineLength;
                   obj.FrameLength = FrameLength;
                   obj.PixelAcqLength = PixelAcqLength;
                   obj.PixelTotalLength = PixelAcqLength + PixelSettleLength;
                   clear VoltSequenceX
                   clear VoltSequenceY  
                case {3, 4, 5}    
                   if isempty(obj.PO2Pos)
                      obj.WaveformX = [];
                      obj.WaveformY = [];
                      obj.PO2Vol = [];
                   else  
                      PO2PosX = repmat(obj.PO2Pos(:,1), [DaqRepeat 1]);
                      PO2PosY = repmat(obj.PO2Pos(:,2), [DaqRepeat 1]);
                      PO2VolX = (PO2PosX-1)*obj.VoltRangeX/(obj.PixelX-1); %  obj.VoltRangeX/2-obj.VoltOffsetX will be subtracted later
                      PO2VolY = (PO2PosY-1)*obj.VoltRangeY/(obj.PixelY-1); %  obj.VoltRangeY/2-obj.VoltOffsetY will be subtracted later
                      %%%% Since obj.PO2Vol will be directly sent to Galvo,
                      %%%% so  obj.VoltRangeX/2-obj.VoltOffsetX and
                      %%%% obj.VoltRangeY/2-obj.VoltOffsetY will be
                      %%%% subtracted here
                      obj.PO2Vol = [PO2VolX+obj.VoltOffsetX-0.5*obj.VoltRangeX PO2VolY+obj.VoltOffsetY-0.5*obj.VoltRangeY];
                      %%% Calculate length of each segment
                      EomExcLength = ceil(obj.ExcPeriod*obj.AO_UpdateRate);
                      AcqDelayLength = ceil(obj.AcqDelayTime*obj.AO_UpdateRate);
                      PixelAcqLength = (EomExcLength + AcqDelayLength)*obj.NumCycles;  
                      PixelRetraceLength = ceil(obj.GalvoFlybackTime*obj.AO_UpdateRate);
                      %%% Transition from (0, 0) to first pixel
                      OffsetArrayX = [PO2VolX; obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanOutX];
                      OffsetArrayY = [PO2VolY; obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanOutY];
                      TransitionX = zeros(PixelRetraceLength,1);
                      TransitionY = zeros(PixelRetraceLength,1);
                      TransitionX = GenPixelRetraceWaveform(PixelRetraceLength, obj.VoltRangeX/2-obj.VoltOffsetX+obj.ScanInX, OffsetArrayX(1));
                      TransitionY = GenPixelRetraceWaveform(PixelRetraceLength, obj.VoltRangeY/2-obj.VoltOffsetY+obj.ScanInY, OffsetArrayY(1));
                      TransitionX = int16(TransitionX*obj.AO_ConversionRatio);
                      TransitionY = int16(TransitionY*obj.AO_ConversionRatio);
                      %%% PixelWaveform and RetraceWaveform
                      WaveformPeriod = PixelAcqLength*size(PO2VolX,1) + PixelRetraceLength*(size(PO2VolX,1)+1);
                      VoltSequenceX = zeros(WaveformPeriod,1);
                      VoltSequenceY = zeros(WaveformPeriod,1);
                      for i=1:size(PO2VolX,1)
                          VoltSequenceX(PixelRetraceLength+1+(i-1)*(PixelAcqLength+PixelRetraceLength):PixelRetraceLength+i*(PixelAcqLength+PixelRetraceLength)) =...
                          [OffsetArrayX(i)*ones(PixelAcqLength,1); GenPixelRetraceWaveform(PixelRetraceLength, OffsetArrayX(i),OffsetArrayX(i+1))];
                          VoltSequenceY(PixelRetraceLength+1+(i-1)*(PixelAcqLength+PixelRetraceLength):PixelRetraceLength+i*(PixelAcqLength+PixelRetraceLength)) =...
                          [OffsetArrayY(i)*ones(PixelAcqLength,1); GenPixelRetraceWaveform(PixelRetraceLength, OffsetArrayY(i),OffsetArrayY(i+1))];
                      end
                      VoltSequenceX = int16(VoltSequenceX*obj.AO_ConversionRatio);
                      VoltSequenceX(1:PixelRetraceLength)=TransitionX;
                      VoltSequenceX = int16((obj.VoltOffsetX-0.5*obj.VoltRangeX)*obj.AO_ConversionRatio)+VoltSequenceX;

                      VoltSequenceY = int16(VoltSequenceY*obj.AO_ConversionRatio);
                      VoltSequenceY(1:PixelRetraceLength)=TransitionY;
                      VoltSequenceY = int16((obj.VoltOffsetY-0.5*obj.VoltRangeY)*obj.AO_ConversionRatio)+VoltSequenceY;
                  
                      obj.WaveformX = VoltSequenceX;
                      obj.WaveformY = VoltSequenceY;
                      obj.DisplayLength = ceil(WaveformPeriod/DaqRepeat);
                      obj.FrameLength = WaveformPeriod;
                      obj.FrameRetraceLength = PixelRetraceLength;
                      obj.PixelAcqLength = PixelAcqLength;
                      obj.PixelTotalLength = PixelAcqLength + PixelRetraceLength;
                      clear VoltSequenceX
                      clear VoltSequenceY
                   end    
           end
           waitbar(1,GalvoWaitbar,'Waveform Generated !');
           pause(0.2);
           close(GalvoWaitbar);
        end
                
        function DisplayWaveform(obj, handle, DaqMode)
            switch DaqMode
               case {0, 1}    %%% CW Scan                       
                  axes(handle);
                  cla(handle)
                  DispTime = (0:obj.DisplayLength-1)/obj.AO_UpdateRate;
                  plot(DispTime, double(obj.WaveformX(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','r');
                  hold on
                  plot(DispTime, double(obj.WaveformY(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','b');
                  hold on
                  plot(DispTime, obj.WaveformRampInd(1:obj.DisplayLength),'color','m');
                  grid on
                  axis tight
               case 2          %%%  pO2 SurveyScan               
                  axes(handle);
                  cla(handle)
                  DispTime = (0:obj.DisplayLength-1)/obj.AO_UpdateRate;
                  plot(DispTime, double(obj.WaveformX(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','r');
                  hold on
                  plot(DispTime, double(obj.WaveformY(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','b');
                  grid on
                  axis tight
               case {3, 4, 5}  
                  axes(handle);
                  cla(handle)
                  DispTime = (0:obj.DisplayLength-1)/obj.AO_UpdateRate;
                  plot(DispTime, double(obj.WaveformX(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','r');
                  hold on
                  plot(DispTime, double(obj.WaveformY(1:obj.DisplayLength))/obj.AO_ConversionRatio, 'color','b');
                  grid on
                  axis tight
            end
            ylabel(handle,'Galvo In (V)','FontSize', 7);
            set(handle,'FontSize',7, 'OuterPosition', [0.61 0.01 0.42 1.1],'Position', [0.655 0.12 0.33 0.82]);
        end

        function Close(obj)
            DAQStopTask(obj.AO_Handle);
            DAQClearTask(obj.AO_Handle);
        end
    end
end
