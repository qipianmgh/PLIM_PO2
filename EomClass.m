% classdef EOMClass  < matlab.mixin.SetGet
classdef EomClass  < handle
    properties % (Access = private)
        AO_Channel
        CaliAI_Channel
        CaliStartTrigChannel
        AO_Handle
        CaliAI_Handle
        CaliStartTrig_Handle
        
        AO_UpdateRate
        AO_ConversionRatio
        PeakVoltage
        PowerPercentage
        PowerMode
        GateWidth
        ExcPeriod
        NumCycles
        PixelDwellTime
        CaliStatus
        DriverAdjStatus
        CaliMinVolt
        CaliMaxVolt
        Offset
        OffsetMeasFlag
        NoisyOffsetFlag
        CaliLUT
        ExtRatio
        VoltMiniInput
        FracMiniOutput
        LaserOutStatus
        Waveform
        
        ActivePixelInd        
    end
    
    methods
        function obj = EomClass()
            obj.AO_Channel = '/PXI1Slot2/ao0';
            obj.CaliAI_Channel = '/PXI1Slot2/ai0';
            obj.CaliStartTrigChannel = '/PXI1Slot2/port0/line5';
            obj.PeakVoltage = double(0);
            obj.PowerPercentage = double(0); %%% 0---100
            obj.PowerMode = logical(0);  % 0: CW; 1: TD 2: FD Mode Sin; 3: FD Mode Squ; 4: Mix TD+CW Mode
            obj.AO_UpdateRate = double(2e6);
            obj.AO_ConversionRatio = double(2^16/10);  %%%  volt to DAC input +-/5V range
            obj.GateWidth = double(10e-6);
            obj.ExcPeriod = double(300e-6);
            obj.NumCycles = double(1);
            obj.PixelDwellTime = double(4e-6);
            obj.AO_Handle = uint64(0);
            obj.CaliAI_Handle = uint64(0);
            obj.CaliStartTrig_Handle = uint64(0);
            obj.CaliStatus = logical(0);
            obj.DriverAdjStatus = logical(0);
            obj.CaliMinVolt = 0;
            obj.CaliMaxVolt = 1.1;
            obj.Offset = double([]);
            obj.OffsetMeasFlag = logical(0);
            obj.NoisyOffsetFlag = logical(0);
            obj.CaliLUT = [];
            obj.ExtRatio = double([]);
            obj.VoltMiniInput = 0;
            obj.FracMiniOutput = 0;
            obj.LaserOutStatus = 0;
            obj.Waveform = double([]);
            obj.ActivePixelInd = [];
        end        
        
        function InitEom(obj) 
            %%% Eom control task
            obj.AO_Handle = DAQCreateTask('EomControl');
            DAQCreateAOVoltChan(obj.AO_Handle, obj.AO_Channel,[-5 5]);
            DAQSetRefClkSrc(obj.AO_Handle, '/PXI1Slot2/PXIe_Clk100');
            DAQSetAODACRefVal(obj.AO_Handle, obj.AO_Channel, 5);
            %%% Eom cali AI task
            obj.CaliAI_Handle = DAQCreateTask('EomCaliAI');
            DAQCreateAIVoltChan(obj.CaliAI_Handle, obj.CaliAI_Channel,[-10 10]);
            DAQSetRefClkSrc(obj.CaliAI_Handle, '/PXI1Slot2/PXIe_Clk100');
            DAQSetAICoupling(obj.CaliAI_Handle, obj.CaliAI_Channel, DAQmx_Val_DC);
            %%% Start cali through PXI1Slot2/PFI1
            obj.CaliStartTrig_Handle = DAQCreateTask('EomCaliStartTrig');
            DAQCreateDOChan(obj.CaliStartTrig_Handle, obj.CaliStartTrigChannel);
            DAQSetRefClkSrc(obj.CaliStartTrig_Handle, '/PXI1Slot2/PXIe_Clk100');
            DAQWriteDigitalLines(obj.CaliStartTrig_Handle, 0); 
        end
        
        function Offset = CaliMeasOffset(obj)
            %%% Configure AI task for offset meas
            DAQCfgSampClkTimingFiniSamps(obj.CaliAI_Handle, ' ',1e6, 1e3);
            DAQSetStartTrigType(obj.CaliAI_Handle, DAQmx_Val_None);   
            %%% Start offset measurement
            DAQStartTask(obj.CaliAI_Handle);
            %%% Read offset measurement & stop tasks
            Offset = DAQReadAnalogF64(obj.CaliAI_Handle, 1e3, zeros(1e3,1));
            DAQStopTask(obj.CaliAI_Handle);
        end  
        
        function Volt = FracToVolt(obj, Frac)
            Volt = interp1(obj.CaliLUT(:,2), obj.CaliLUT(:,1), Frac,'PCHIP');
        end
        
        function Frac = VoltToFrac(obj, Volt)
            Frac = interp1(obj.CaliLUT(:,1), obj.CaliLUT(:,2), Volt,'PCHIP');
        end

        function GenerateWaveform(obj, DaqMode)
            switch DaqMode
                case {0, 1}   %%% CW Mode
                   obj.Waveform = obj.PeakVoltage*ones(round(obj.PixelDwellTime*obj.AO_UpdateRate),1);
                   obj.Waveform = int16(obj.Waveform*obj.AO_ConversionRatio);
                case {2, 3, 4, 5}   %%% TD Mode
                   EomGatePts = obj.PeakVoltage*ones(round(obj.GateWidth*obj.AO_UpdateRate),1);
                   if obj.CaliStatus
                      EomOffPts = obj.VoltMiniInput*ones(round((obj.ExcPeriod-obj.GateWidth)*obj.AO_UpdateRate),1);
                   else
                      EomOffPts = zeros(round((obj.ExcPeriod-obj.GateWidth)*obj.AO_UpdateRate),1);
                   end
                   EomSequence = [EomGatePts;EomOffPts];
                   obj.Waveform = int16(EomSequence*obj.AO_ConversionRatio);                    
            end           
        end

        function DisplayWaveform(obj, handle, DaqMode)
            switch DaqMode
                case {0, 1}   %%% CW Mode
                   axes(handle);
                   cla(handle)
                   DispTime = (0:length(obj.Waveform)-1)/obj.AO_UpdateRate;
                   line(DispTime, double(obj.Waveform)/obj.AO_ConversionRatio, 'color','b');
                   grid on
                   axis tight 
                   ylim([0 1.5]);
                   ylabel(handle,'Eom In (V)','FontSize', 7.5);
                   set(handle,'FontSize', 7.5, 'OuterPosition',[0.05 0 1.10 0.62], 'Position', [0.17 0.10 0.8 0.4]);
                case {2, 3, 4, 5}   %%% TD Mode
                   axes(handle);
                   cla(handle);
                   DispTime = (0:length(obj.Waveform)-1)/obj.AO_UpdateRate;
                   line(DispTime, double(obj.Waveform)/obj.AO_ConversionRatio, 'color','b');
                   grid on
                   axis tight
                   ylim([0 1.5]);
                   ylabel(handle,'Eom In (V)','FontSize', 7.5);
                   set(handle,'FontSize', 7.5, 'OuterPosition',[0.05 0 1.10 0.62], 'Position', [0.17 0.10 0.8 0.4]);                   
            end     
        end
        
        function Close(obj)
            %%% Stop and clear Eom control task
            DAQStopTask(obj.AO_Handle);
            DAQClearTask(obj.AO_Handle);
            %%% Stop and clear EomCaliAI task
            DAQStopTask(obj.CaliAI_Handle);
            DAQClearTask(obj.CaliAI_Handle);
            %%% Stop and clear EomCaliStartTrig task
            DAQStopTask(obj.CaliStartTrig_Handle);
            DAQClearTask(obj.CaliStartTrig_Handle);
        end
       
    end
    
end
