classdef DaqClass < handle
    properties
         StartTrigChannel
         FZ_StartTrigChannel
         FrameTrigChannel
         EomExcTrigChannel
         LineTrigChannel
         PixelTrigChannel
         PhotonCntrSampClk
         PhotonCntr
         PhotonCntrRes
         
         StartTrig_Handle
         FZ_StartTrig_Handle
         FrameTrig_Handle
         EomExcTrig_Handle
         LineTrig_Handle
         PixelTrig_Handle
         PhotonCntrSampClk_Handle
         PhotonCntr_Handle
         
         Shutter0_Channel
         Shutter1_Channel
         Shutter2_Channel
         Shutter1_SyncChannel
         Shutter2_SyncChannel
         Shutter0_Handle
         Shutter1_Handle
         Shutter2_Handle
         Shutter1_Sync_Handle
         Shutter2_Sync_Handle
         ShutterStatus
         Shutter0_SilenceStatus
         
         CI_ActiveStatus
         AI_ActiveChannel
         AI_InverseChannel
         AI_SampClkTD_Channel
         AI_Handle
         AI_SampClkTD_Handle
         AI_Range
         AI_RangeList
         AI_SampleRate
         AI_ScalingCoeff
         AI_VoltCaliFlag
         AI_Offset
         AI_OffsetSubFlag
         SamplePerPx
         PixelDwellTime
         FrameRate
         StackInfo
         FrameNum
         DaqRepeat
         DaqStatus
         DaqMode
         
         SurveyScanImg
         AI_SurveyScanImg
         SurveyImgActiveType
         SurveyScanFtrStatus
         SurveyScanColorbarMin
         SurveyScanColorbarMax
         
         TPSF_Display
         PO2Pos_Display
         DisplayStatus
         SaveStatus
         SavePath
         SaveFilenameList
         SaveFilename
         PhotonCntsMoniStatus
         PhotonCntsMoniSampNum
         PhotonCntsMoniArray
         PhotonCntsMoniRate
         AccelerMoniStatus
         AccelerMoniSampNum
         AccelerMoniArray
         
         AcqAllPhotonStatus
         AxesColorbarMax
         AxesColorbarMin
         AxesColormap
         ColormapRange 
         
         BrainSurfaceSetStatus
         BrainSurfacePosZ
    end
    
    methods
        
        function obj = DaqClass()
            obj.StartTrigChannel = '/PXI1Slot3/port0/line1'; 
            obj.FZ_StartTrigChannel = '/PXI1Slot4/port0/line0'; %%% for Angiogram
            obj.FrameTrigChannel = '/PXI1Slot4/ctr0';  %%% for Angiogram
            obj.EomExcTrigChannel = '/PXI1Slot3/ctr3';  %%% for pO2
            obj.LineTrigChannel = '/PXI1Slot4/ctr1';  %%% for pO2 Surveyscan
            obj.PixelTrigChannel = '/PXI1Slot4/ctr3';  %%% for pO2
            obj.PhotonCntrSampClk = '/PXI1Slot3/ctr1';  %%% for pO2
            obj.PhotonCntr = '/PXI1Slot3/ctr2';  %%% for pO2
            obj.PhotonCntrRes = 2e-6; %%%  1 us temporal resolution
            
            obj.StartTrig_Handle = uint64(0);
            obj.FZ_StartTrig_Handle = uint64(0);
            obj.FrameTrig_Handle = uint64(0);
            obj.EomExcTrig_Handle = uint64(0);
            obj.LineTrig_Handle = uint64(0);
            obj.PixelTrig_Handle = uint64(0);
            obj.PhotonCntrSampClk_Handle = uint64(0);
            obj.PhotonCntr_Handle = uint64(0);       
            
            obj.Shutter0_Channel = '/PXI1Slot2/port0/line0';
            obj.Shutter1_Channel = '/PXI1Slot2/port0/line1';
            obj.Shutter2_Channel = '/PXI1Slot2/port0/line2';
            obj.Shutter1_SyncChannel = '/PXI1Slot2/port0/line3';
            obj.Shutter2_SyncChannel = '/PXI1Slot2/port0/line4';
            obj.Shutter0_Handle = uint64(0);
            obj.Shutter1_Handle = uint64(0);
            obj.Shutter2_Handle = uint64(0);
            obj.Shutter1_Sync_Handle = uint64(0);
            obj.Shutter2_Sync_Handle = uint64(0);         
            obj.ShutterStatus = logical([0 0 0]);
            obj.Shutter0_SilenceStatus = logical(0);
            
            obj.CI_ActiveStatus = 0;
            obj.AI_ActiveChannel = logical([0 0 1 1 1 0 0 0]);   %%% ai 0 Eom output; 1 accelerometer; 2:4 data 5,7 Galvo X Y; 6 FZ 
            obj.AI_InverseChannel = logical([1 0 1 1 1 0 0 0]);  %%% ai 0 Eom output; 1 accelerometer; 2:4 data 5,7 Galvo X Y; 6 FZ 
            obj.AI_SampClkTD_Channel = '/PXI1Slot2/ctr3';
            obj.AI_Handle = uint64(0);
            obj.AI_SampClkTD_Handle = uint64(0);
            obj.AI_Range = double([10 5 5 5 5 5 10 5]);%%% ai 0 Eom output; 1 accelerometer [0.6 2.4] for +/-3g  
            obj.AI_RangeList = double([1 2 5 10]);
            obj.AI_SampleRate = double(1e6);
            obj.AI_ScalingCoeff = double([]);
            obj.AI_VoltCaliFlag = 0;  %%% 0: do not apply volt cali for ai channels; 1: apply volt cali for ai channels.
            obj.AI_Offset = [];
            obj.AI_OffsetSubFlag = logical([1 0 1 1 1 0 0 0]); %%% ai 0 Eom output; 1 accelerometer; 2:4 data; 5,7 Galvo; 6 FZ
            obj.SamplePerPx = 4;
            obj.PixelDwellTime = obj.SamplePerPx/obj.AI_SampleRate;
            obj.FrameRate = 0;
            obj.StackInfo = [0 0 2]; %%% StackStart StackEnd StackStep in um
            obj.FrameNum = 1;
            obj.DaqRepeat = 1;
            obj.DaqStatus = logical(0);  % 0: SurveyScan 1: Acq 
            obj.DaqMode = uint8(0);  % 0: Angio SurveyScan  1: Angio Acq 2: pO2 SurveyScan 3: pO2 Acq Galvo 4: pO2 Acq_TD_DeepTissueSlow 5: pO2 Acq_TD_DeepTissueFast 
            obj.SurveyScanFtrStatus = logical(0); %%% No median filter applied on SurveyScan Img
            obj.SurveyScanColorbarMin = 0;
            obj.SurveyScanColorbarMax = 100;
            obj.DisplayStatus = logical(1); % 0: Not display 1: Display
            obj.TPSF_Display = [];
            obj.PO2Pos_Display = [];
            %%% Data save info
            SavePathRoot = 'E:\Data\';
            listing = dir(SavePathRoot);
            SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')];
            if isempty(find(ismember({listing.name},SaveFolder)))
               mkdir('E:\Data\',SaveFolder);
            else
            end
            obj.SaveStatus = logical(1); % 0: Not save 1: Save            
            obj.SavePath = ['E:\Data\',SaveFolder,'\'];
            obj.SaveFilenameList = {'AngioSurveyScan','AngioStack','pO2_SurveyScan','pO2_Galvo_TD',...
                                    'pO2_Galvo_TD','pO2_Galvo_TD'}; 
            obj.SaveFilename = obj.SaveFilenameList{obj.DaqMode+1};
            obj.SurveyScanImg = [];
            obj.AI_SurveyScanImg = [];
            obj.SurveyImgActiveType = 0;  %%% 0: AI_SurveyScanImg; 1: SurveyScanImg (CI_SurveyScanImg)
            obj.PhotonCntsMoniStatus = logical(0);
            obj.PhotonCntsMoniSampNum = 101;
            obj.PhotonCntsMoniArray = zeros(obj.PhotonCntsMoniSampNum,1);
            obj.PhotonCntsMoniRate = 100;
            obj.AccelerMoniStatus = logical(0);
            obj.AccelerMoniSampNum = 1000;
            obj.AccelerMoniArray = zeros(obj.AccelerMoniSampNum,1);

            obj.AcqAllPhotonStatus = logical(0);
            obj.AxesColorbarMax = [100 100 100 100];
            obj.AxesColorbarMin = [0 0 0 0];
            obj.AxesColormap = [1 1 1 1];
            obj.ColormapRange = {'gray','jet','hot','hsv'};
            
            obj.BrainSurfaceSetStatus = 0;
            obj.BrainSurfacePosZ = [];
        end
        
        function InitDaq(obj) 
            %%%  For Signal Monitor of Eom Exc Trigger
            DAQConnectTerms('/PXI1Slot3/Ctr3InternalOutput','/PXI1Slot3/PFI2');
            %%%  For Seq Trigger in functional activation
            DAQConnectTerms('/PXI1Slot2/Ctr2InternalOutput','/PXI1Slot2/PFI2');
            %%%  Create Shutter Tasks
            %%%  Shutter 0
            obj.Shutter0_Handle = DAQCreateTask('Shutter0');
            DAQCreateDOChan(obj.Shutter0_Handle,obj.Shutter0_Channel);
            DAQSetRefClkSrc(obj.Shutter0_Handle, '/PXI1Slot2/PXIe_Clk100');
            %%%  Shutter 1
            obj.Shutter1_Handle = DAQCreateTask('Shutter1');
            DAQCreateDOChan(obj.Shutter1_Handle,obj.Shutter1_Channel);
            DAQSetRefClkSrc(obj.Shutter1_Handle, '/PXI1Slot2/PXIe_Clk100');
            %%%  Shutter 1 Sync
            obj.Shutter1_Sync_Handle = DAQCreateTask('Shutter1_Sync');
            DAQCreateDIChan(obj.Shutter1_Sync_Handle,obj.Shutter1_SyncChannel);
            DAQSetRefClkSrc(obj.Shutter1_Sync_Handle, '/PXI1Slot2/PXIe_Clk100');
            %%%  Shutter 2
            obj.Shutter2_Handle = DAQCreateTask('Shutter2');
            DAQCreateDOChan(obj.Shutter2_Handle,obj.Shutter2_Channel);
            DAQSetRefClkSrc(obj.Shutter2_Handle, '/PXI1Slot2/PXIe_Clk100');
            %%%  Shutter 2 Sync
            obj.Shutter2_Sync_Handle = DAQCreateTask('Shutter2_Sync');   
            DAQCreateDIChan(obj.Shutter2_Sync_Handle,obj.Shutter2_SyncChannel);
            DAQSetRefClkSrc(obj.Shutter2_Sync_Handle, '/PXI1Slot2/PXIe_Clk100');
            %%% Close all shutters 
            DAQWriteDigitalLines(obj.Shutter0_Handle, 0); 
            DAQWriteDigitalLines(obj.Shutter1_Handle, 0); 
            DAQWriteDigitalLines(obj.Shutter2_Handle, 0); 
            while DAQReadDigitalLines(obj.Shutter1_Sync_Handle)~=0 & DAQReadDigitalLines(obj.Shutter2_Sync_Handle)~=0
            end
            obj.ShutterStatus = [0 0 0]; 
            %%% Create Trigger and PMT Channels (Reference Clk Src must follow task creation !!!)
            %%% Initial configure Start trigger     
            obj.StartTrig_Handle = DAQCreateTask('StartTrigger');
            DAQCreateDOChan(obj.StartTrig_Handle, obj.StartTrigChannel);
            DAQSetRefClkSrc(obj.StartTrig_Handle, '/PXI1Slot3/PXIe_Clk100');
            DAQWriteDigitalLines(obj.StartTrig_Handle, 0); 
            %%% Initial configure FZ_Start trigger     
            obj.FZ_StartTrig_Handle = DAQCreateTask('FZ_StartTrigger');
            DAQCreateDOChan(obj.FZ_StartTrig_Handle, obj.FZ_StartTrigChannel);
            DAQSetRefClkSrc(obj.FZ_StartTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            DAQWriteDigitalLines(obj.FZ_StartTrig_Handle, 0);             
            %%% Initial configure Frame trigger (Angiogram) 
            obj.FrameTrig_Handle = DAQCreateTask('FrameTrigger');
            DAQCreateCOPulseChanTicks(obj.FrameTrig_Handle, obj.FrameTrigChannel, '/PXI1Slot4/ao/SampleClock', 0, 100, 100);
            DAQSetRefClkSrc(obj.FrameTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            %%% Initial configure Eom Exc trigger (TD pO2 SurveyScan)
            obj.EomExcTrig_Handle = DAQCreateTask('EomExcTrigger');
            DAQCreateCOPulseChanFreq(obj.EomExcTrig_Handle, obj.EomExcTrigChannel, 0, 100, 0.2);
            DAQSetRefClkSrc(obj.EomExcTrig_Handle, '/PXI1Slot3/PXIe_Clk100'); 
            %%% Initial configure Line trigger (TD pO2 SurveyScan)
            obj.LineTrig_Handle = DAQCreateTask('LineTrigger');
            DAQCreateCOPulseChanTicks(obj.LineTrig_Handle, obj.LineTrigChannel, '/PXI1Slot3/ao/SampleClock', 0, 100, 100);
            DAQSetRefClkSrc(obj.LineTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            %%% Initial configure Pixel trigger (TD pO2)
            obj.PixelTrig_Handle = DAQCreateTask('PixelTrigger');
            DAQCreateCOPulseChanTicks(obj.PixelTrig_Handle, obj.PixelTrigChannel, '/PXI1Slot3/ao/SampleClock', 0, 100, 100);
            DAQSetRefClkSrc(obj.PixelTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            %%% Initial configure PhotonCntr sample clock 
            obj.PhotonCntrSampClk_Handle = DAQCreateTask('PhotonCntrSampClk');
            DAQCreateCOPulseChanFreq(obj.PhotonCntrSampClk_Handle, obj.PhotonCntrSampClk, 0, 100, 0.5);
            DAQSetRefClkSrc(obj.PhotonCntrSampClk_Handle , '/PXI1Slot3/PXIe_Clk100');          
            %%% Configure PhotonCntr  
            obj.PhotonCntr_Handle = DAQCreateTask('PhotonCntr');
            DAQCreateCICountEdgesChan(obj.PhotonCntr_Handle, obj.PhotonCntr);
            DAQSetRefClkSrc(obj.PhotonCntr_Handle, '/PXI1Slot3/PXIe_Clk100');
            %%% Configure AI task
            obj.AI_Handle = DAQCreateTask('DaqAI');
            DAQCreateAIVoltageChan(obj.AI_Handle, '/PXI1Slot2/ai0:7', [-5 5]);
            DAQSetRefClkSrc(obj.AI_Handle, '/PXI1Slot2/PXIe_Clk100');
            DAQSetAICoupling(obj.AI_Handle, '/PXI1Slot2/ai0:7', DAQmx_Val_DC);
            %%% Configure AI SampClk for TD tasks with '/PXI1Slot2/ctr3' 
            obj.AI_SampClkTD_Handle = DAQCreateTask('AI_SampClkTD');
            DAQCreateCOPulseChanFreq(obj.AI_SampClkTD_Handle, obj.AI_SampClkTD_Channel, 0, 4e3, 0.2);
            DAQSetRefClkSrc(obj.AI_SampClkTD_Handle, '/PXI1Slot2/PXIe_Clk100'); 
            %%% Get AI_ScalingCoeff
            for i = 1: 8
                ActiveChannel = ['PXI1Slot2/ai', num2str(i-1)];
                DAQSetAIMin(obj.AI_Handle, ActiveChannel, -obj.AI_Range(i));
                DAQSetAIMax(obj.AI_Handle, ActiveChannel, obj.AI_Range(i));
                obj.AI_ScalingCoeff = [obj.AI_ScalingCoeff; DAQGetAIDevScalingCoeff(obj.AI_Handle, ActiveChannel)];
            end
        end
         
        function Shutter0_Open(obj)
            DAQWriteDigitalLines(obj.Shutter0_Handle, 1); 
            pause(0.1);
            obj.ShutterStatus(1) = 1;
        end
        
        function Shutter0_Close(obj)
            DAQWriteDigitalLines(obj.Shutter0_Handle, 0); 
            pause(0.1)
            obj.ShutterStatus(1) = 0;
        end
      
        function Shutter1_Open(obj)
            DAQWriteDigitalLines(obj.Shutter1_Handle, 1); 
            pause(0.1)
            obj.ShutterStatus(2) = 1;
        end
        
        function Shutter1_Close(obj)
            DAQWriteDigitalLines(obj.Shutter1_Handle, 0); 
            pause(0.1)
            obj.ShutterStatus(2) = 0;
        end

        function Shutter2_Open(obj)
            DAQWriteDigitalLines(obj.Shutter2_Handle, 1); 
            pause(0.1)
            obj.ShutterStatus(3) = 1;
        end
        
        function Shutter2_Close(obj)
            DAQWriteDigitalLines(obj.Shutter2_Handle, 0); 
            pause(0.1)
            obj.ShutterStatus(3) = 0;
        end
        
        function AcqShutterOpen(obj)
            if obj.Shutter0_SilenceStatus
            else
               obj.Shutter0_Open();
            end
            if obj.CI_ActiveStatus | obj.AI_ActiveChannel(2+1) 
               obj.Shutter1_Open();
            else
               obj.Shutter1_Close();
            end             
            if obj.AI_ActiveChannel(3+1) | obj.AI_ActiveChannel(4+1)
               obj.Shutter2_Open();
            else
               obj.Shutter2_Close();
            end  
        end
               
        function AcqShutterClose(obj)
            if obj.Shutter0_SilenceStatus
            else
               obj.Shutter0_Close();
            end
            if obj.CI_ActiveStatus | obj.AI_ActiveChannel(2+1)
               obj.Shutter1_Close();
            end
            
            if obj.AI_ActiveChannel(3+1) | obj.AI_ActiveChannel(4+1)
               obj.Shutter2_Close();
            end  
        end
                             
        function Close(obj)
            %%%  Disconnect Terminals of Eom Exc Trigger
            DAQDisconnectTerms('/PXI1Slot3/Ctr3InternalOutput','/PXI1Slot3/PFI2');
            %%%  Disconnect Seq Trigger 
            DAQDisconnectTerms('/PXI1Slot2/Ctr2InternalOutput','/PXI1Slot2/PFI2');
            %%%  Stop and Clear tasks
            if any(obj.ShutterStatus)
               if obj.Shutter0_SilenceStatus
                  obj.Shutter0_SilenceStatus = 0;
                  obj.Shutter0_Close();
               else
                  obj.Shutter0_Close(); 
               end
               obj.Shutter1_Close();
               obj.Shutter2_Close();
            end
            DAQStopTask(obj.Shutter0_Handle);
            DAQStopTask(obj.Shutter1_Handle);
            DAQStopTask(obj.Shutter2_Handle);
            DAQStopTask(obj.Shutter1_Sync_Handle);
            DAQStopTask(obj.Shutter2_Sync_Handle);
             
            DAQClearTask(obj.Shutter0_Handle);
            DAQClearTask(obj.Shutter1_Handle);
            DAQClearTask(obj.Shutter2_Handle);
            DAQClearTask(obj.Shutter1_Sync_Handle);
            DAQClearTask(obj.Shutter2_Sync_Handle);

            DAQStopTask(obj.StartTrig_Handle); 
            DAQStopTask(obj.FZ_StartTrig_Handle); 
            DAQStopTask(obj.FrameTrig_Handle);
            DAQStopTask(obj.EomExcTrig_Handle);
            DAQStopTask(obj.LineTrig_Handle);
            DAQStopTask(obj.PixelTrig_Handle);
            DAQStopTask(obj.PhotonCntrSampClk_Handle);
            DAQStopTask(obj.PhotonCntr_Handle); 
            DAQStopTask(obj.AI_Handle);
            DAQStopTask(obj.AI_SampClkTD_Handle);
             
            DAQClearTask(obj.StartTrig_Handle); 
            DAQClearTask(obj.FZ_StartTrig_Handle); 
            DAQClearTask(obj.FrameTrig_Handle);
            DAQClearTask(obj.EomExcTrig_Handle);
            DAQClearTask(obj.LineTrig_Handle);
            DAQClearTask(obj.PixelTrig_Handle);
            DAQClearTask(obj.PhotonCntrSampClk_Handle); 
            DAQClearTask(obj.PhotonCntr_Handle); 
            DAQClearTask(obj.AI_Handle);
            DAQClearTask(obj.AI_SampClkTD_Handle);
        end 
    end     
end    