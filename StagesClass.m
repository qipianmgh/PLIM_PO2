% classdef StagesClass < matlab.mixin.SetGet
classdef StagesClass < handle
    properties
            ControllerXY 
            StagenameXY 
            ControllerZ 
            StagenameZ 
            ControllerFZ 
            StagenameFZ 
            axisnameX 
            axisnameY 
            
            UsageStatus
            CurrentPos 
            SetPos 
            StageStep
            ObjectiveType
            StageFZ_CloseLoop
            StageFZ_IO_Params
            StageFZ_NotchParams
            StageFZ_PID_ConstParams
            StageFZ_DaqInputChannel
            StageFZ_DaqOutputChannel
            StageFZ_Control_Handle
            StageFZ_Feedback_Handle
            
            StageFZ_SettleTime
            StageFZ_FlybackTime
            StageFZ_AcqDelayTime
            StageFZ_AO_UpdateRate
            
            StageFZ_CaliP_Input
            StageFZ_CaliP_Output
            StageFZ_Waveform
            StageFZ_FrameLength
            StageFZ_RetraceLength
            StageFZ_SettleLength
            StageFZ_ReturnFlag
            WavDisplayMode
    end
    
    methods
        function obj = StagesClass()           
            obj.ControllerXY = '';
            obj.StagenameXY = 'M-126.DG';
            obj.ControllerZ = serial('COM7','BaudRate',9600);
            obj.StagenameZ = 'ZFM 2020';
            obj.ControllerFZ = '';
            obj.StagenameFZ = '';
            obj.axisnameX = char('0');
            obj.axisnameY = char('0');
            
            obj.UsageStatus = logical([0 0 0 0]);
            obj.CurrentPos = double([0 0 0 0]);
            obj.SetPos = double([0 0 0 0]);
            obj.StageStep = double([100 100 100 10]);
            obj.ObjectiveType = uint8(1);  %%% 1: 20X objectives 2: 25X objective 3: 4X objective
            obj.StageFZ_CloseLoop = '';
            obj.StageFZ_IO_Params = '';
            obj.StageFZ_NotchParams = '';
            obj.StageFZ_PID_ConstParams = '';
            obj.StageFZ_DaqInputChannel = '/PXI1Slot4/ai4';
            obj.StageFZ_DaqOutputChannel = '/PXI1Slot4/ao0';
            obj.StageFZ_Control_Handle = uint64(0);
            obj.StageFZ_Feedback_Handle = uint64(0);
            obj.StageFZ_SettleTime = double(30e-3);      %%% uint: s
            obj.StageFZ_FlybackTime = double(1e-1);   %%% uint: s
            obj.StageFZ_AcqDelayTime = double(35e-3);    %%% uint: s
            obj.StageFZ_AO_UpdateRate = double(1e5);  
            
            if obj.ObjectiveType == 1  %%% 1: 20X objectives 2: 25X objective 3: 4X objective
               load('E:\PLIM_PO2\CaliStageFZ_20X.mat');                
            elseif obj.ObjectiveType == 2
               load('E:\PLIM_PO2\CaliStageFZ_25X.mat');  
            else
               load('E:\PLIM_PO2\CaliStageFZ_4X.mat');   
            end
            obj.StageFZ_CaliP_Input = CaliP_Input;
            obj.StageFZ_CaliP_Output = CaliP_Output;
            
            obj.StageFZ_Waveform = double([]);
            obj.StageFZ_FrameLength = [];
            obj.StageFZ_RetraceLength = [];
            obj.StageFZ_SettleLength = [];
            obj.WavDisplayMode = logical(0);
            obj.StageFZ_ReturnFlag = logical(0);
        end
        
        function InitStageXY_Home(obj)
            % XY Stage connect using PCI            
            obj.ControllerXY = C843_GCS_Controller();
            obj.ControllerXY = obj.ControllerXY.Connect(1);
            obj.ControllerXY = obj.ControllerXY.InitializeController();
            % query ControllerXY identification
            obj.ControllerXY.qIDN();
            % query axes
            availableaxes = obj.ControllerXY.qSAI_ALL();
            if(isempty(availableaxes)) % if empty return 1, not return 0
	           return;
            end
            for i=1:2
               axisname = availableaxes(i);
               % connect a stage
               obj.ControllerXY.CST(axisname,obj.StagenameXY);
               obj.ControllerXY.qCST(axisname);
               % init a stage
               obj.ControllerXY.INI(axisname);
               % switch on servo and search reference switch to reference stage
               obj.ControllerXY.RON(axisname, 1);
               obj.ControllerXY.FNL(axisname);
               bReferencing = 1;
               % wait for Referencing to finish
               while(bReferencing)
                   pause(0.1);
                   bReferencing = (obj.ControllerXY.IsReferencing(axisname)==1);
               end 
            end
            obj.axisnameX = availableaxes(1);
            obj.axisnameY = availableaxes(2);
            % Move from (12.5 12.5) to (0 0)
            obj.HomeStageX();
            obj.HomeStageY();
            obj.UsageStatus(1:2) = 1;
        end
        
        function InitStageZ_Home(obj)
            %%% Z stage ZFM2020
            fopen(obj.ControllerZ);
            obj.UsageStatus(3) = 1;
            obj.CurrentPos(3) = -MCM3000_Pos_Decode(obj.ControllerZ)*1000;
            obj.SetPos(3) = obj.CurrentPos(3);
        end
                
        function InitStageFZ_Home(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*

            DeviceManagerCLI.BuildDeviceList();
            DeviceManagerCLI.GetDeviceListSize();
            obj.ControllerFZ = BenchtopPrecisionPiezo.CreateBenchtopPiezo('44000151'); 
            obj.ControllerFZ.Connect('44000151');

            obj.StagenameFZ = obj.ControllerFZ.GetChannel(1);
            obj.StagenameFZ.WaitForSettingsInitialized(5000);
            obj.StagenameFZ.StartPolling(250);
            pause(0.5);
            obj.StagenameFZ.EnableDevice();
            pause(0.5) ;
            obj.StageFZ_CloseLoop = obj.StagenameFZ.IsClosedLoop();
            obj.StagenameFZ.SetPosition(0);
            pause(0.5);
            %%% Set IO_Params 
            obj.StageFZ_Set_IO_Params();
            %%% Set Notch_Params & PIDConst_Params 
            obj.StageFZ_ConfigureObj();
            if obj.ObjectiveType == 1  %%% 1: 20X objectives 2: 25X objective 3: 4X objective
               load('E:\PLIM_PO2\CaliStageFZ_20X.mat');                
            elseif obj.ObjectiveType == 2
               load('E:\PLIM_PO2\CaliStageFZ_25X.mat');    
            else
               load('E:\PLIM_PO2\CaliStageFZ_4X.mat');     
            end
            obj.StageFZ_CaliP_Input = CaliP_Input;
            obj.StageFZ_CaliP_Output = CaliP_Output;
            %%% Init Daq for FZ operation            
            obj.StageFZ_Control_Handle = DAQCreateTask('StageFZ_Control'); 
            obj.StageFZ_Feedback_Handle = DAQCreateTask('StageFZ_Feedback');    
            DAQCreateAOVoltChan(obj.StageFZ_Control_Handle,obj.StageFZ_DaqOutputChannel,[-10 10]);
            DAQCreateAIVoltChan(obj.StageFZ_Feedback_Handle,obj.StageFZ_DaqInputChannel,[-10 10]);
            DAQSetRefClkSrc(obj.StageFZ_Control_Handle, '/PXI1Slot4/PXIe_Clk100');
            DAQSetRefClkSrc(obj.StageFZ_Feedback_Handle, '/PXI1Slot4/PXIe_Clk100');
            DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Control_Handle,' ',obj.StageFZ_AO_UpdateRate, 2);
            DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Feedback_Handle,' ',obj.StageFZ_AO_UpdateRate, 100);
            val = (0-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
            val_read = zeros(100,1);
            %%% Read Pos 
            DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val*ones(2,1));
            DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
            pause(0.5);
            val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
            DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
            StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1); 
            DAQStopTask(obj.StageFZ_Control_Handle);
            DAQStopTask(obj.StageFZ_Feedback_Handle);
            %%% Save Pos 
            obj.UsageStatus(4) = 1;
            obj.CurrentPos(4) = StageFZ_Pos;
            obj.SetPos(4) = obj.CurrentPos(4);
        end
        
        function StageFZ_Set_IO_Params(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            obj.StageFZ_IO_Params = obj.StagenameFZ.GetIOParams();
            obj.StageFZ_IO_Params.ControlSrc = PPCIOControlModes.ExternalBNC;           %%% SoftwareOnly ExternalBNC, Joystick, JoystickBNC
            obj.StageFZ_IO_Params.MonitorOPSig = PPCIOOutputModes.PositionCorrected;    %%% HV, PositionRaw PositionCorrected
            obj.StageFZ_IO_Params.MonitorOPBandwidth = PPCIOOutputBandwidths.OP_200Hz;  %%% OP_Unfiltered OP_200Hz
            obj.StageFZ_IO_Params.FPBrightness = PPCDisplayIntensitys.Off;              %%% Bright, Dim
            obj.StagenameFZ.SetIOParams(obj.StageFZ_IO_Params); 
        end
      
        function StageFZ_ConfigureObj(obj) 
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            obj.StageFZ_NotchParams = obj.StagenameFZ.GetNotchParams();
            obj.StageFZ_PID_ConstParams = obj.StagenameFZ.GetPIDConstParams();
            switch obj.ObjectiveType
               case 1   %%%  20X objective
                  %%% Set NotchParams
                  obj.StageFZ_NotchParams.NotchFilter2On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.NotchFilter1On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.Filter2QFactor = System.Decimal(1);
                  obj.StageFZ_NotchParams.Filter1QFactor = System.Decimal(2);
                  obj.StageFZ_NotchParams.Filter2CenterFreqency = System.Decimal(107);
                  obj.StageFZ_NotchParams.Filter1CenterFreqency = System.Decimal(83);
                  obj.StagenameFZ.SetNotchParams(obj.StageFZ_NotchParams);
                  %%% Set PIDConstParams
                  obj.StageFZ_PID_ConstParams.PIDDerivFilterOn = PPCFilterStates.Off;
                  obj.StageFZ_PID_ConstParams.PIDConstsDFc = System.Decimal(1000);
                  obj.StageFZ_PID_ConstParams.PIDConstsD = System.Decimal(50);
                  obj.StageFZ_PID_ConstParams.PIDConstsI = System.Decimal(480);
                  obj.StageFZ_PID_ConstParams.PIDConstsP = System.Decimal(540);
                  obj.StagenameFZ.SetPIDConstParams(obj.StageFZ_PID_ConstParams);
               case 2   %%%  25X objective
                  %%% Set NotchParams
                  obj.StageFZ_NotchParams.NotchFilter2On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.NotchFilter1On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.Filter2QFactor = System.Decimal(1);
                  obj.StageFZ_NotchParams.Filter1QFactor = System.Decimal(2);
                  obj.StageFZ_NotchParams.Filter2CenterFreqency = System.Decimal(94);
                  obj.StageFZ_NotchParams.Filter1CenterFreqency = System.Decimal(58);
                  obj.StagenameFZ.SetNotchParams(obj.StageFZ_NotchParams);
                  %%% Set PIDConstParams
                  obj.StageFZ_PID_ConstParams.PIDDerivFilterOn = PPCFilterStates.On;
                  obj.StageFZ_PID_ConstParams.PIDConstsDFc = System.Decimal(1000);
                  obj.StageFZ_PID_ConstParams.PIDConstsD = System.Decimal(5000);
                  obj.StageFZ_PID_ConstParams.PIDConstsI = System.Decimal(400);
                  obj.StageFZ_PID_ConstParams.PIDConstsP = System.Decimal(400);
                  obj.StagenameFZ.SetPIDConstParams(obj.StageFZ_PID_ConstParams);
               case 3   %%%  4X objective
                  %%% Set NotchParams
                  obj.StageFZ_NotchParams.NotchFilter2On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.NotchFilter1On = PPCNotchFilterStates.On;
                  obj.StageFZ_NotchParams.Filter2QFactor = System.Decimal(1);
                  obj.StageFZ_NotchParams.Filter1QFactor = System.Decimal(2);
                  obj.StageFZ_NotchParams.Filter2CenterFreqency = System.Decimal(107);
                  obj.StageFZ_NotchParams.Filter1CenterFreqency = System.Decimal(83);
                  obj.StagenameFZ.SetNotchParams(obj.StageFZ_NotchParams);
                  %%% Set PIDConstParams
                  obj.StageFZ_PID_ConstParams.PIDDerivFilterOn = PPCFilterStates.Off;
                  obj.StageFZ_PID_ConstParams.PIDConstsDFc = System.Decimal(1000);
                  obj.StageFZ_PID_ConstParams.PIDConstsD = System.Decimal(50);
                  obj.StageFZ_PID_ConstParams.PIDConstsI = System.Decimal(480);
                  obj.StageFZ_PID_ConstParams.PIDConstsP = System.Decimal(540);
                  obj.StagenameFZ.SetPIDConstParams(obj.StageFZ_PID_ConstParams);
            end
        end
              
        function InitStageXY_LoadPos(obj, StageXY_InitStatus, PosLoad)
            %%% Load position file  (status = 0 : read and load pos; status = 1 : read but not load pos file; status = 2 : no pos file found.   
            if StageXY_InitStatus == 0             
               %%% read and load pos file
               %%% XY Stage connect using PCI 
               obj.ControllerXY = C843_GCS_Controller();
               obj.ControllerXY = obj.ControllerXY.Connect(1);
               obj.ControllerXY = obj.ControllerXY.InitializeController();
               % query ControllerXY identification
               obj.ControllerXY.qIDN();
               % query axes
               availableaxes = obj.ControllerXY.qSAI_ALL();
               if (isempty(availableaxes)) % if empty return 1, not return 0
	           return;
               end
               % Reference XY stage by setting absolute pos 
               for i = 1:2
                   axisname = availableaxes(i);
                   % connect a stage
                   obj.ControllerXY.CST(axisname,obj.StagenameXY);
                   obj.ControllerXY.qCST(axisname);
                   % init a stage
                   obj.ControllerXY.INI(axisname);
                   % set reference mode to zero(absolute pos input needed)
                   obj.ControllerXY.RON(axisname, 0);
                   PosSet = 12.5000 - PosLoad(i)/1000;
                   obj.ControllerXY.POS(axisname,PosSet);
                   bReferencing = 1;
                   % wait for Referencing to finish
                   while(bReferencing)
                      pause(0.1);
                      bReferencing = (obj.ControllerXY.IsReferencing(axisname)==1);
                   end 
                   obj.ControllerXY.RON(axisname, 1);
               end
               obj.axisnameX = availableaxes(1);
               obj.axisnameY = availableaxes(2);
               obj.CurrentPos(1) = PosLoad(1); 
               obj.SetPos(1) = obj.CurrentPos(1);
               obj.CurrentPos(2) = PosLoad(2);
               obj.SetPos(2) = obj.CurrentPos(2);
               obj.UsageStatus(1:2) = 1;
            else
               %%% read but not load pos file or no pos file found 
               obj.UsageStatus(1:2) = 0;
            end
        end
        
        function InitStageZ_LoadPos(obj)
            %%%  Z stage MCM3000
            fopen(obj.ControllerZ);
            obj.UsageStatus(3) = 1;
            obj.CurrentPos(3) = -MCM3000_Pos_Decode(obj.ControllerZ)*1000; 
            obj.SetPos(3) = obj.CurrentPos(3);
        end
        
        function InitStageFZ_LoadPos(obj, StageFZ_InitStatus, PosLoad)
            if StageFZ_InitStatus == 0   %%% Initialize to PosLoad
               %%% StageFZ load library
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
               import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
               import Thorlabs.MotionControl.DeviceManagerCLI.*
               import Thorlabs.MotionControl.GenericPiezoCLI.*

               DeviceManagerCLI.BuildDeviceList();
               DeviceManagerCLI.GetDeviceListSize();
               obj.ControllerFZ = BenchtopPrecisionPiezo.CreateBenchtopPiezo('44000151'); 
               obj.ControllerFZ.Connect('44000151');
            
               obj.StagenameFZ = obj.ControllerFZ.GetChannel(1);
               obj.StagenameFZ.WaitForSettingsInitialized(5000);
               obj.StagenameFZ.StartPolling(250);
               pause(0.5);
               obj.StagenameFZ.EnableDevice();
               pause(0.5);
            
               obj.StageFZ_CloseLoop = obj.StagenameFZ.IsClosedLoop();
               obj.StagenameFZ.SetPosition(0);
               pause(0.5);
               %%% Set IO_Params 
               obj.StageFZ_Set_IO_Params();
               %%% Set Notch_Params & PIDConst_Params 
               obj.StageFZ_ConfigureObj();
               if obj.ObjectiveType == 1  %%% 1: 20X objectives 2: 25X objective 3: 4X  objective
                  load('E:\PLIM_PO2\CaliStageFZ_20X.mat');                
               elseif obj.ObjectiveType == 2
                  load('E:\PLIM_PO2\CaliStageFZ_25X.mat'); 
               else
                  load('E:\PLIM_PO2\CaliStageFZ_4X.mat');  
               end
               obj.StageFZ_CaliP_Input = CaliP_Input;
               obj.StageFZ_CaliP_Output = CaliP_Output;
               %%% Init Daq for FZ operation       
               obj.StageFZ_Control_Handle = DAQCreateTask('StageFZ_Control'); 
               obj.StageFZ_Feedback_Handle = DAQCreateTask('StageFZ_Feedback');    
               DAQCreateAOVoltChan(obj.StageFZ_Control_Handle,obj.StageFZ_DaqOutputChannel,[-10 10]);
               DAQCreateAIVoltChan(obj.StageFZ_Feedback_Handle,obj.StageFZ_DaqInputChannel,[-10 10]);
               DAQSetRefClkSrc(obj.StageFZ_Control_Handle, '/PXI1Slot4/PXIe_Clk100');
               DAQSetRefClkSrc(obj.StageFZ_Feedback_Handle, '/PXI1Slot4/PXIe_Clk100');
               DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Control_Handle,' ',obj.StageFZ_AO_UpdateRate, 2);
               DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Feedback_Handle,' ',obj.StageFZ_AO_UpdateRate, 100);
               %%%  Read Pos
               val = (PosLoad-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
               val_read = zeros(100,1);
               DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val*ones(2,1));
               DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
               pause(0.5);
               val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1); 
               DAQStopTask(obj.StageFZ_Control_Handle);
               DAQStopTask(obj.StageFZ_Feedback_Handle);
               %%% 
               obj.UsageStatus(4) = 1;
               obj.CurrentPos(4) = StageFZ_Pos;
               obj.SetPos(4) = obj.CurrentPos(4);
            elseif StageFZ_InitStatus == 1   %%% Return to zero
               %%% StageFZ load library
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
               NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
               import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
               import Thorlabs.MotionControl.DeviceManagerCLI.*
               import Thorlabs.MotionControl.GenericPiezoCLI.*

               DeviceManagerCLI.BuildDeviceList();
               DeviceManagerCLI.GetDeviceListSize();
               obj.ControllerFZ = BenchtopPrecisionPiezo.CreateBenchtopPiezo('44000151'); 
               obj.ControllerFZ.Connect('44000151');
            
               obj.StagenameFZ = obj.ControllerFZ.GetChannel(1);
               obj.StagenameFZ.WaitForSettingsInitialized(5000);
               obj.StagenameFZ.StartPolling(250);
               pause(0.5);
               obj.StagenameFZ.EnableDevice();
               pause(0.5);
            
               obj.StageFZ_CloseLoop = obj.StagenameFZ.IsClosedLoop();
               obj.StagenameFZ.SetPosition(0);
               pause(0.5);
               %%% Set IO_Params 
               obj.StageFZ_Set_IO_Params();
               %%% Set Notch_Params & PIDConst_Params 
               obj.StageFZ_ConfigureObj();
               if obj.ObjectiveType == 1  %%% 1: 20X objectives 2: 25X objective 3: 4X objective
                  load('E:\PLIM_PO2\CaliStageFZ_20X.mat');                
               elseif obj.ObjectiveType == 2
                  load('E:\PLIM_PO2\CaliStageFZ_25X.mat'); 
               else
                  load('E:\PLIM_PO2\CaliStageFZ_4X.mat');  
               end
               obj.StageFZ_CaliP_Input = CaliP_Input;
               obj.StageFZ_CaliP_Output = CaliP_Output;
               %%% Init Daq for FZ operation       
               obj.StageFZ_Control_Handle = DAQCreateTask('StageFZ_Control'); 
               obj.StageFZ_Feedback_Handle = DAQCreateTask('StageFZ_Feedback');    
               DAQCreateAOVoltChan(obj.StageFZ_Control_Handle,obj.StageFZ_DaqOutputChannel,[-10 10]);
               DAQCreateAIVoltChan(obj.StageFZ_Feedback_Handle,obj.StageFZ_DaqInputChannel,[-10 10]);
               DAQSetRefClkSrc(obj.StageFZ_Control_Handle, '/PXI1Slot4/PXIe_Clk100');
               DAQSetRefClkSrc(obj.StageFZ_Feedback_Handle, '/PXI1Slot4/PXIe_Clk100');
               DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Control_Handle,' ',obj.StageFZ_AO_UpdateRate, 2);
               DAQCfgSampClkTimingFiniSamps(obj.StageFZ_Feedback_Handle,' ',obj.StageFZ_AO_UpdateRate, 100);
               %%%  Read Pos
               val = (0-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
               val_read = zeros(100,1);
               DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val*ones(2,1));
               DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
               pause(0.5);
               val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1); 
               DAQStopTask(obj.StageFZ_Control_Handle);
               DAQStopTask(obj.StageFZ_Feedback_Handle);
               %%% 
               obj.UsageStatus(4) = 1;
               obj.CurrentPos(4) = StageFZ_Pos;
               obj.SetPos(4) = obj.CurrentPos(4);
            else  %%% Not initialize Stage FZ
               obj.UsageStatus(4) = 0;
               obj.CurrentPos(4) = 0;
               obj.SetPos(4) = 0;
            end
        end
      
        function CalibrateStageFZ(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            obj.StageFZ_CloseLoop = obj.StagenameFZ.GetPositionControlMode();
            %%%  Set to SW only mode first and move to zero pos
            obj.StageFZ_IO_Params = obj.StagenameFZ.GetIOParams();
            obj.StageFZ_IO_Params.ControlSrc = PPCIOControlModes.SoftwareOnly;          %%% ExternalBNC, Joystick, JoystickBNC
            obj.StageFZ_IO_Params.MonitorOPSig = PPCIOOutputModes.PositionCorrected;    %%% HV, PositionRaw 
            obj.StageFZ_IO_Params.MonitorOPBandwidth = PPCIOOutputBandwidths.OP_200Hz;  %%% OP_Unfiltered 
            obj.StageFZ_IO_Params.FPBrightness = PPCDisplayIntensitys.Off;              %%% Bright, Dim
            obj.StagenameFZ.SetIOParams(obj.StageFZ_IO_Params);
            obj.StagenameFZ.SetPosition(0);
            pause(0.5);
            %%% Set Notch_Params & PIDConst_Params 
            obj.StageFZ_ConfigureObj();
            %%%  Calibration Output and Pos
            CaliSamplePts = 451;
            CaliMeasPts = 100;
            %%% Calibration SoftwareInputOnly
            StageFZ_PosCaliRead = zeros(CaliSamplePts,1);
            StageFZ_PosCaliFit = zeros(CaliSamplePts,1);
            StageFZ_PosCali = zeros(CaliSamplePts,1);
            StageFZ_VoltReadTemp = zeros(CaliMeasPts,1);
            %%% Add progressbar
            f_input_cali = waitbar(0,'Calibrating Daq Input from FastZ!');
            for i_StageFZ=1:CaliSamplePts
                StageFZ_PosCali(i_StageFZ,1)= (i_StageFZ-1)*450/(CaliSamplePts-1);
                obj.StagenameFZ.SetPosition(StageFZ_PosCali(i_StageFZ));
                pause(0.1);
                StageFZ_VoltReadTemp = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, CaliMeasPts, StageFZ_VoltReadTemp);
                StageFZ_PosCaliRead(i_StageFZ) = mean(StageFZ_VoltReadTemp); 
                waitbar(i_StageFZ/CaliSamplePts,f_input_cali,'Calibrating FastZ Input!');
            end
            close(f_input_cali);
            figure
            scatter(StageFZ_PosCali(1:10:CaliSamplePts), StageFZ_PosCaliRead(1:10:CaliSamplePts),'b','filled');
            CaliP_Input = polyfit(StageFZ_PosCali, StageFZ_PosCaliRead,1);
            StageFZ_PosCaliFit = polyval(CaliP_Input,StageFZ_PosCali);
            hold on
            plot(StageFZ_PosCali,StageFZ_PosCaliFit,'r-.','Linewidth',2);
            legend('Meas','Fit');
            grid on
            %%% Cal R_Squared
            Bbar = mean(StageFZ_PosCaliRead);
            SStot = sum((StageFZ_PosCaliRead - Bbar).^2);
            SSres = sum((StageFZ_PosCaliRead - StageFZ_PosCaliFit).^2);
            Rsq1 = 1 - SSres/SStot;
            text(150,2,['Volt=', num2str(CaliP_Input(1),'%2.4f'),'*Dis',num2str(CaliP_Input(2),'%+2.4f'),'  R=',num2str(Rsq1)],'fontsize',12);
            obj.StageFZ_CaliP_Input = CaliP_Input;
            obj.StagenameFZ.SetPosition(0);
            pause(0.5);
            %%%  Set to SW only+External input mode  and move to zero pos
            obj.StageFZ_Set_IO_Params();
            %%%  Create AO task
            %%%  Calibration ExternalBNC input
            CaliSamplePts2 = 451;
            StageFZ_PosCaliWrite2 = linspace(0,10,CaliSamplePts2)';
            StageFZ_PosCaliRead2 = zeros(CaliSamplePts2,1);
            StageFZ_PosCali2 = zeros(CaliSamplePts2,1);
            StageFZ_PosCaliFit2 = zeros(CaliSamplePts2,1);
            %%% Interp SoftwareOnly Calibration to 0.01 um
            StageFZ_PosCali_Interp = interp1(StageFZ_PosCali,StageFZ_PosCaliRead,linspace(0,450,45001),'linear'); 
            f_output_cali = waitbar(0,'Calibrating Daq Output to FastZ!');
            for i_StageFZ = 1:CaliSamplePts2
                DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, StageFZ_PosCaliWrite2(i_StageFZ)*ones(2,1));
                pause(0.5);
                StageFZ_PosCaliFit2(i_StageFZ) = System.Decimal.ToDouble(obj.StagenameFZ.GetPosition());                
                DAQStopTask(obj.StageFZ_Control_Handle);
                waitbar(i_StageFZ/CaliSamplePts2,f_output_cali,'Calibrating FastZ Output!');
            end
            close(f_output_cali);
            figure
            scatter( StageFZ_PosCaliWrite2(1:10:CaliSamplePts2),StageFZ_PosCaliFit2(1:10:CaliSamplePts2),'b','filled');
            CaliP_Output = polyfit(StageFZ_PosCaliWrite2,StageFZ_PosCaliFit2,1);
            StageFZ_PosCaliFit3 = polyval(CaliP_Output,StageFZ_PosCaliWrite2);
            hold on
            plot(StageFZ_PosCaliWrite2,StageFZ_PosCaliFit3,'r-.','Linewidth',2);
            legend('Meas','Fit');
            grid on
            %%% Cal R_Squared
            Bbar = mean(StageFZ_PosCaliFit2);
            SStot = sum((StageFZ_PosCaliFit2 - Bbar).^2);
            SSres = sum((StageFZ_PosCaliFit2 - StageFZ_PosCaliFit3).^2);
            Rsq2 = 1 - SSres/SStot;

            text(4,50,['Dis=', num2str(CaliP_Output(1),'%2.4f'),'*Volt',num2str(CaliP_Output(2),'%+2.4f'),'  R=',num2str(Rsq2)],'fontsize',12);
            obj.StageFZ_CaliP_Output = CaliP_Output;
            CaliTable = StageFZ_PosCaliFit3;
            TimeStr = datestr(now,'yyyy-mm-dd_HHMMSS');
            if obj.ObjectiveType == 1
               save('E:\PLIM_PO2\CaliStageFZ_20X.mat','CaliP_Input','CaliP_Output','CaliTable');                  
               save(['E:\PLIM_PO2\StageFZ_Cali\CaliStageFZ_20X_',TimeStr,'.mat'],'CaliP_Input','CaliP_Output','CaliTable');                  
            elseif obj.ObjectiveType == 2
               save('E:\PLIM_PO2\CaliStageFZ_25X.mat','CaliP_Input','CaliP_Output','CaliTable');                    
               save(['E:\PLIM_PO2\StageFZ_Cali\CaliStageFZ_25X_',TimeStr,'.mat'],'CaliP_Input','CaliP_Output','CaliTable');                   
            else
               save('E:\PLIM_PO2\CaliStageFZ_4X.mat','CaliP_Input','CaliP_Output','CaliTable');                  
               save(['E:\PLIM_PO2\StageFZ_Cali\CaliStageFZ_4X_',TimeStr,'.mat'],'CaliP_Input','CaliP_Output','CaliTable');                  
            end
            %%% Set piezo to zero after calibration
            val_read = zeros(CaliMeasPts,1);
            val = (0-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
            DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1 , val*ones(2,1));
            pause(0.5);
            val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
            DAQStopTask(obj.StageFZ_Feedback_Handle);
            DAQStopTask(obj.StageFZ_Control_Handle); 
            StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1); 
            obj.CurrentPos(4) = StageFZ_Pos;
            obj.SetPos(4) = obj.CurrentPos(4);  
        end
      
        function MoveStageX(obj,val)
            Move_Dis = (val-obj.CurrentPos(1))/1000;
            obj.ControllerXY.MVR(obj.axisnameX, -1*Move_Dis);
            % MVR: Moves specified axes relative to current position.
            while(obj.ControllerXY.IsMoving(obj.axisnameX))
               pause(0.1);
            end
            PosX = obj.ControllerXY.qPOS(obj.axisnameX);
            obj.CurrentPos(1) = (-1*PosX+12.5)*1000; 
            obj.SetPos(1) = obj.CurrentPos(1);
        end
        
        function HomeStageX(obj)
            PosX = obj.ControllerXY.qPOS(obj.axisnameX);
            obj.ControllerXY.MVR(obj.axisnameX,-1*PosX+12.5000);
            % MVR: Moves specified axes relative to current position.
            while(obj.ControllerXY.IsMoving(obj.axisnameX))
               pause(0.1);
            end
            PosX = obj.ControllerXY.qPOS(obj.axisnameX);
            obj.CurrentPos(1) = (-1*PosX+12.5000)*1000;
            obj.SetPos(1) = obj.CurrentPos(1);
        end
      
        function StopStageX(obj)
            obj.ControllerXY.STP();
            while(obj.ControllerXY.IsMoving(obj.axisnameX))
               pause(0.1);
            end
            PosX = obj.ControllerXY.qPOS(obj.axisnameX);
            obj.CurrentPos(1) = (-1*PosX+12.5)*1000; 
            obj.SetPos(1) = obj.CurrentPos(1);
        end
        
        function MoveStageY(obj,val)
            Move_Dis = (val-obj.CurrentPos(2))/1000;
            obj.ControllerXY.MVR(obj.axisnameY, -1*Move_Dis);
            % MVR: Moves specified axes relative to current position.
            while(obj.ControllerXY.IsMoving(obj.axisnameY))
               pause(0.1);
            end
            PosY = obj.ControllerXY.qPOS(obj.axisnameY);
            obj.CurrentPos(2) = (-1*PosY+12.5)*1000; 
            obj.SetPos(2) = obj.CurrentPos(2);
        end
        
        function HomeStageY(obj)
            PosY = obj.ControllerXY.qPOS(obj.axisnameY);
            obj.ControllerXY.MVR(obj.axisnameY,-1*PosY+12.5000);
            % MVR: Moves specified axes relative to current position.
            while(obj.ControllerXY.IsMoving(obj.axisnameY))
               pause(0.1);
            end
            PosY = obj.ControllerXY.qPOS(obj.axisnameY);
            obj.CurrentPos(2) = (-1*PosY+12.5000)*1000;
            obj.SetPos(2) = obj.CurrentPos(2);
        end
      
        function StopStageY(obj)
            obj.ControllerXY.STP();
            while(obj.ControllerXY.IsMoving(obj.axisnameY))
               pause(0.1);
            end
            PosY = obj.ControllerXY.qPOS(obj.axisnameY);
            obj.CurrentPos(2) = (-1*PosY+12.5)*1000;
            obj.SetPos(2) = obj.CurrentPos(2);
        end
        
        function QueryPosStageZ(obj)            
            obj.CurrentPos(3) = -MCM3000_Pos_Decode(obj.ControllerZ)*1000;
        end
        
        function MoveStageZ(obj,val)
            Move_Dis = MCM3000_Pos_Encode(-val/1000);
            MCM3000_Pos_Sent(obj.ControllerZ,Move_Dis);
            pause(0.5);
            PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            while MCM3000_Is_Busy(obj.ControllerZ) | PosZ~= MCM3000_Pos_Decode(obj.ControllerZ)
                PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            end
            PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            obj.CurrentPos(3) = -PosZ*1000;
            obj.SetPos(3) = obj.CurrentPos(3);
        end
        
        function HomeStageZ(obj)
            PosZ_code = MCM3000_Pos_Encode(-14);
            MCM3000_Pos_Sent(obj.ControllerZ,PosZ_code);
            pause(0.5);
            PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            while MCM3000_Is_Busy(obj.ControllerZ) | PosZ~=MCM3000_Pos_Decode(obj.ControllerZ) 
               PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            end
            PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
            obj.CurrentPos(3) = -PosZ*1000;
            obj.SetPos(3) = obj.CurrentPos(3);
        end
      
        function StopStageZ(obj)
%             MCM3000_Stop(obj.ControllerZ);
%             while MCM3000_Is_Busy(obj.ControllerZ) 
%                PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
%             end
%             PosZ = MCM3000_Pos_Decode(obj.ControllerZ);
%             obj.CurrentPos(3) = -PosZ*1000;
%             obj.SetPos(3) = obj.CurrentPos(3);
        end
      
        function QueryPosStageFZ(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
                        
            temp = char(obj.StageFZ_IO_Params.ControlSrc);
            if strcmp(temp, 'SoftwareOnly')
               StageFZ_Pos = System.Decimal.ToDouble(obj.StagenameFZ.GetPosition());
            else
               val_read = zeros(100,1);
               val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               DAQStopTask(obj.StageFZ_Feedback_Handle); 
               StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1);
            end
            obj.CurrentPos(4) = StageFZ_Pos;
        end
        
        function MoveStageFZ(obj,val)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            temp = char(obj.StageFZ_IO_Params.ControlSrc);
            if strcmp(temp, 'SoftwareOnly')
               obj.StagenameFZ.SetPosition(val);
               pause(0.5);
               StageFZ_Pos = System.Decimal.ToDouble(obj.StagenameFZ.GetPosition());
            else
               val_read = zeros(100,1);
               val_write = (val - obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
               val_write = min(val_write,10);
               DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val_write*ones(2,1));
               DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
               pause(0.5);       
               val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               DAQStopTask(obj.StageFZ_Control_Handle); 
               DAQStopTask(obj.StageFZ_Feedback_Handle); 
               StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1);
            end
            obj.CurrentPos(4) = StageFZ_Pos;
            obj.SetPos(4) = obj.CurrentPos(4); 
        end
      
        function HomeStageFZ(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            temp = char(obj.StageFZ_IO_Params.ControlSrc);
            if strcmp(temp, 'SoftwareOnly')               
               obj.StagenameFZ.SetPosition(0);
               pause(0.5);
               StageFZ_Pos = System.Decimal.ToDouble(obj.StagenameFZ.GetPosition());
            else
               val_read = zeros(100,1);
               val = (0-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
               DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val*ones(2,1));
               DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
               pause(0.5);
               val_read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               DAQStopTask(obj.StageFZ_Control_Handle); 
               DAQStopTask(obj.StageFZ_Feedback_Handle);   
               StageFZ_Pos = (mean(val_read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1);
            end
            obj.CurrentPos(4) = StageFZ_Pos;
            obj.SetPos(4) = obj.CurrentPos(4); 
        end
           
        function StopStageFZ(obj)   %%% Move back to home
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            temp = char(obj.StageFZ_IO_Params.ControlSrc);
            if strcmp(temp, 'SoftwareOnly')               
               obj.StagenameFZ.SetPosition(0);
               pause(0.5);
               StageFZ_Pos = System.Decimal.ToDouble(obj.StagenameFZ.GetPosition());
            else
               val_Read = zeros(100,1);
               val = (0-obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
               DAQWriteAnalogF64(obj.StageFZ_Control_Handle, 2, 1, val*ones(2,1));
               DAQWaitUntilTaskDone(obj.StageFZ_Control_Handle, -1);
               pause(0.5);
               val_Read = DAQReadAnalogF64(obj.StageFZ_Feedback_Handle, 100, val_Read);
               DAQWaitUntilTaskDone(obj.StageFZ_Feedback_Handle, -1);
               DAQStopTask(obj.StageFZ_Control_Handle); 
               DAQStopTask(obj.StageFZ_Feedback_Handle);   
               StageFZ_Pos = (mean(val_Read)-obj.StageFZ_CaliP_Input(2))/obj.StageFZ_CaliP_Input(1);
            end
            obj.CurrentPos(4) = StageFZ_Pos;
            obj.SetPos(4) = obj.CurrentPos(4); 
        end
      
        function GenerateWaveformFZ(obj, StackInfo, FrameRate, DaqMode)
            switch DaqMode
               case 1   %%%%%  Angiogram Stack
                 FZ_Pos = (StackInfo(1):StackInfo(3):StackInfo(2))'; %%% StackStart, StackEnd, StackStep,
                 FZ_PosVolts = (FZ_Pos - obj.StageFZ_CaliP_Output(2))/obj.StageFZ_CaliP_Output(1);
                 FZ_PosVolts(FZ_PosVolts>10) = 10;
                 DAC_ConversionRatio = 2^16/20;
                 MinFrameLength = ceil(1/FrameRate*obj.StageFZ_AO_UpdateRate);
                 FZ_SettleLength = ceil(obj.StageFZ_SettleTime*obj.StageFZ_AO_UpdateRate);
                 FZ_SettleLength = FZ_SettleLength + rem(FZ_SettleLength,2);
                 FZ_AcqDelayLength = ceil(obj.StageFZ_AcqDelayTime*obj.StageFZ_AO_UpdateRate);
                 FZ_RetraceLength = ceil(obj.StageFZ_FlybackTime*obj.StageFZ_AO_UpdateRate);
                 FZ_RetraceLength = FZ_RetraceLength + rem(FZ_RetraceLength,2);
                 FZ_FrameLength = MinFrameLength + FZ_AcqDelayLength + FZ_SettleLength;
                 FZ_FrameLength = FZ_FrameLength + rem(FZ_FrameLength,2);
           
                 obj.StageFZ_Waveform = GenFZ_Waveform(FZ_FrameLength, FZ_SettleLength, FZ_RetraceLength, obj.StageFZ_ReturnFlag, FZ_PosVolts);  
                 obj.StageFZ_Waveform = int16(obj.StageFZ_Waveform*DAC_ConversionRatio);
                 obj.StageFZ_FrameLength = FZ_FrameLength;
                 obj.StageFZ_RetraceLength = FZ_RetraceLength;
                 obj.StageFZ_SettleLength = FZ_SettleLength;
               otherwise
                 obj.StageFZ_Waveform = []; 
                 obj.StageFZ_FrameLength = [];
                 obj.StageFZ_RetraceLength = [];
                 obj.StageFZ_SettleLength = [];
            end
        end

        function DisplayWaveform(obj, handle, DaqMode)
            if obj.WavDisplayMode
               if DaqMode == 1   %%%%%  Angiogram Stack
                  axes(handle);
                  cla(handle)
                  plot(1:length(obj.StageFZ_Waveform), obj.StageFZ_Waveform, 'color','r');  
                  grid on
                  axis tight
                  ylabel(handle,'Fz Input','FontSize', 7);
                  set(handle,'FontSize',7, 'OuterPosition', [0.635 0.01 0.405 1.05],'Position', [0.675 0.12 0.305 0.815]);
               else
                  axes(handle);
                  cla(handle) 
               end
            else
               return;
            end
        end
        %%% Close StageXY
        function CloseStageXY(obj)
            %obj.ControllerXY.CloseConnection();
            obj.ControllerXY.Destroy();  
            obj.UsageStatus(1:2) = 0;
        end
        %%% Close StageZ
        function CloseStageZ(obj)
            fclose(obj.ControllerZ);
            obj.UsageStatus(3) = 0;
        end
        %%% Close StageFZ
        function CloseStageFZ(obj)
            %%% StageFZ load library
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
            NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');
            import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*
            import Thorlabs.MotionControl.DeviceManagerCLI.*
            import Thorlabs.MotionControl.GenericPiezoCLI.*
            
            %%% Turn on LED for FZ stage again
            obj.StageFZ_IO_Params = obj.StagenameFZ.GetIOParams();
            obj.StageFZ_IO_Params.FPBrightness = PPCDisplayIntensitys.Dim;              %%% Bright, Dim
            obj.StagenameFZ.SetIOParams(obj.StageFZ_IO_Params);
            %%% Close FZ stage
            obj.StagenameFZ.StopPolling();
            obj.ControllerFZ.Disconnect();
            obj.StagenameFZ.ShutDown();
            DAQClearTask(obj.StageFZ_Control_Handle);
            DAQClearTask(obj.StageFZ_Feedback_Handle);
            obj.UsageStatus(4) = 0;
        end
    end     
end

