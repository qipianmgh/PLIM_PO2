%%% Control SW for PLIM_PO2 designed by Qi Pian
%%% Last updated on 11/21/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = PLIM_PO2(varargin)
% Last Modified by GUIDE v2.5 01-Apr-2024 14:55:19
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PLIM_PO2_OpeningFcn, ...
                   'gui_OutputFcn',  @PLIM_PO2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

%%% GUI Opening Function
function PLIM_PO2_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%%%%%%%%%%%%%%%%%%%%%%%%%%% Reset DAQ boards
cd('E:\PLIM_PO2');
DAQResetDevice('PXI1Slot2');
DAQResetDevice('PXI1Slot3');
DAQResetDevice('PXI1Slot4');
%%%%%%%%%%%%%%%%%%%%%%%%%%% Define properties of each module and initialize
handles.Stages = StagesClass();            
handles.Eom = EomClass();
handles.Galvo = GalvoClass();
handles.Daq = DaqClass();
handles.Camera = CameraClass();
handles.SLM = SLM_Class();
%%% Init system status display
s_SystemStatus = {};
set(handles.listbox_SystemStatus,'string', s_SystemStatus);
%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize stages
%%% Set objective controller parameters
quest0 = 'Which objective is being used ?';
answer0 = questdlg(quest0,'Objective controller setting','20X','25X','4X','20X');   
switch answer0
   case '20X'
      handles.Stages.ObjectiveType = 1;
      DispSystStatus(handles, '20X objective is being used !');
   case '25X'
      handles.Stages.ObjectiveType = 2;
      DispSystStatus(handles, '25X objective is being used !');
   case '4X'
      handles.Stages.ObjectiveType = 3;
      DispSystStatus(handles, '4X objective is being used !');
   otherwise
      handles.Stages.ObjectiveType = 1;
      DispSystStatus(handles, '20X objective is being used !'); 
end
%%% Loading stage positions or initialize stages (X, Y, FZ) to zero
quest1 = 'Loading saved stage positions?';
answer1 = questdlg(quest1,'Init stages ?','Yes','No','No');   
switch answer1
   case 'Yes'
      %%% Load position file  (status = 0 : read and load pos; status = 1 : read but not load pos file; status = 2 : no pos file found.   
      [file, path] = uigetfile('*.mat','Select saved stage position file');
      if file ~= 0
         %%% Load file
         PosLoad = struct2array(load([path,file]));
         quest2 = sprintf('Loading Stage XY positions [%5.4f %5.4f]?', PosLoad(1:2));
         answer2 = questdlg(quest2,'Init Stage XY ?','Yes','No','No');   
         switch answer2
             case 'Yes'
                %%% read and load pos file
                %%% XY Stage connect using PCI 
                StageXY_InitStatus = 0;
                handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus, PosLoad(1:2));
                DispSystStatus(handles, 'Stage position file read and loaded !');
                DispSystStatus(handles, 'M-126 stages are initialized !');               
             case 'No'
                %%% read but not load pos file
                StageXY_InitStatus = 1;
                handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
                DispSystStatus(handles, 'Stage position file read but not loaded !');
                DispSystStatus(handles, 'M-126 stages are not initialized !');
         end
      else
         %%% No pos file found 
         StageXY_InitStatus = 2;
         handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
         DispSystStatus(handles, 'Stage position file not found !');
         DispSystStatus(handles, 'M-126 stages are not initialized !'); 
      end  
      %%% Z stage init
      handles.Stages.InitStageZ_LoadPos();
      DispSystStatus(handles, 'ZFM2020 stage is initialized !');
      %%% FZ stage init 
      if file ~= 0
         quest3 = sprintf('Loading Stage FZ positions %3.4f ?', PosLoad(4));
         answer3 = questdlg(quest3,'Init Stage FZ ?','Yes','Return to zero','Return to zero');   
         switch answer3
             case 'Yes'
                %%% read and load pos file
                %%% XY Stage connect using PCI 
                StageFZ_InitStatus = 0;
                handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus, PosLoad(4)); 
                DispSystStatus(handles, 'PFM450E stage is initialized !');
             case 'Return to zero'
                %%% read but not load pos file
                StageFZ_InitStatus = 1;
                handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                DispSystStatus(handles, 'PFM450E stage is initialized !');
         end
      else
         quest4 = sprintf('No saved FZ Stage position found, initialize to zero?');
         answer4 = questdlg(quest4,'Init Stage FZ ?','Yes','No','Yes');   
         switch answer4 
             case 'Yes'
                %%% Initialize FZ Stage to zero
                StageFZ_InitStatus = 1;
                handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                DispSystStatus(handles, 'PFM450E stage is initialized !');
             case 'No'
                %%% No pos file found, do not initialize FZ Stage 
                StageFZ_InitStatus = 2;
                handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                DispSystStatus(handles, 'PFM450E stage is not initialized !');
         end
      end 
   case 'No'
      %%% XY stage init
      handles.Stages.InitStageXY_Home();
      DispSystStatus(handles, 'M-126 stages are initialized !');
      %%% Z stage init
      handles.Stages.InitStageZ_Home();
      DispSystStatus(handles, 'ZFM2020 stage is initialized !');
      %%% FZ stage init
      handles.Stages.InitStageFZ_Home();
      DispSystStatus(handles, 'PFM450E stage is initialized !');
end
%%% Update Stage status display
UpdateStageStatusDisp(hObject, eventdata, handles);
DispSystStatus(handles, 'Stages Init Done !');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize EOM control
handles.Eom.InitEom();
%%% Update Eom status display
UpdateEomStatusDisp(hObject, eventdata, handles);
DispSystStatus(handles, 'Eom Init Done !');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize Galvo control
handles.Galvo.InitGalvo();
%%% Update Galvo status display and FOV size display
handles.Galvo.DistPerVolt = handles.Galvo.DistPerVoltList(handles.Stages.ObjectiveType);
handles.Galvo.FOV = handles.Galvo.DistPerVolt*handles.Galvo.VoltRangeX;
UpdateGalvoStatusDisp(hObject, eventdata, handles);
DispSystStatus(handles, 'Galvo Init Done !');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize Daq related, close all shutters;
handles.Daq.InitDaq();
%%% Update Daq status display
UpdateDaqStatusDisp(hObject, eventdata, handles);
DispSystStatus(handles, 'Shutters are initialized !');
DispSystStatus(handles, 'Daq Init Done !');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Display waveforms of Eom Galvo and StageFZ
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles);
%%% Initialize CriticalDisplay
handles.CriticalDispMode = [1 0 0 0 0];
set(handles.radiobutton_SelectCamera,'value',1);
set(handles.listbox_PixelSelected,'string',''); 
%%% Update SLM status display
UpdateSLM_StatusDisp(hObject, eventdata, handles);
DispSystStatus(handles, 'SLM not Initiated !');
%%% Initialize Camera display
DispSystStatus(handles, 'Basler camera not initiated !');
%%% Update Camera status display
UpdateCameraStatusDisp(hObject, eventdata, handles);
%%% Set menu for result image display
handles.ContextmenuCh1 = uicontextmenu;
uimenu(handles.ContextmenuCh1,'Label','Save','Callback',{@ResultImageSaveCh1_Fcn,handles.axes_Ch1,handles.Daq.SavePath});
handles.ContextmenuCh2 = uicontextmenu;
uimenu(handles.ContextmenuCh2,'Label','Save','Callback',{@ResultImageSaveCh2_Fcn,handles.axes_Ch2,handles.Daq.SavePath});
handles.ContextmenuCh3 = uicontextmenu;
uimenu(handles.ContextmenuCh3,'Label','Save','Callback',{@ResultImageSaveCh3_Fcn,handles.axes_Ch3,handles.Daq.SavePath});
handles.ContextmenuCh4 = uicontextmenu;
uimenu(handles.ContextmenuCh4,'Label','Save','Callback',{@ResultImageSaveCh4_Fcn,handles.axes_Ch4,handles.Daq.SavePath});
%%% Set mouse position tracking
fhandle_mousemove = 'PLIM_PO2(''figure1_WindowButtonMotionFcn'',gcbo,[],guidata(gcbo))';
set(handles.figure1,'WindowButtonMotionFcn',fhandle_mousemove);
%%% Save handles
guidata(hObject, handles);

%%% GUI Output Function
function varargout = PLIM_PO2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%%% Load .mat file for Acq parameters
function pushbutton_LoadPara_Callback(hObject, eventdata, handles)
[file0 path0] = uigetfile('E:\Data\*.mat','Select data acquisition parameter file');
if file0 ~= 0
   %%% Load file
   AcqPara = load([path0,file0]);
   if isfield(AcqPara, 'StagesPara')
      handles.Stages = AcqPara.StagesPara;
   end
   if isfield(AcqPara, 'EomPara')
      handles.Eom = AcqPara.EomPara;
   end
   if isfield(AcqPara, 'GalvoPara')
      handles.Galvo = AcqPara.GalvoPara;
   end
   if isfield(AcqPara, 'DaqPara')
      handles.Daq = AcqPara.DaqPara;
   end
   if isfield(AcqPara, 'CameraPara')
      handles.Camera = AcqPara.CameraPara;
   end
   if isfield(AcqPara, 'SLM_Para')
      handles.SLM = AcqPara.SLM_Para;
   end
   %%%%%%%%%%%%%%%%%%%%%%%%%%% Update Stages status
   quest1 = 'Loading saved stage positions?';
   answer1 = questdlg(quest1,'Init stages ?','Yes','No','No');   
   switch answer1
      case 'Yes'
         %%% Load position file  (status = 0 : read and load pos; status = 1 : read but not load pos file; status = 2 : no pos file found.   
         [file path] = uigetfile('*.mat','Select saved stage position file');
         if file ~= 0
            %%% Load file
            PosLoad = struct2array(load([path,file]));
            quest2 = sprintf('Loading Stage XY positions [%5.4f %5.4f]?', PosLoad(1:2));
            answer2 = questdlg(quest2,'Init Stage XY ?','Yes','No','No');   
            switch answer2
                case 'Yes'
                   %%% read and load pos file
                   %%% XY Stage connect using PCI 
                   StageXY_InitStatus = 0;
                   handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus, PosLoad(1:2));
                   DispSystStatus(handles, 'Stage position file read and loaded !');
                   DispSystStatus(handles, 'M-126 stages are initialized !');               
                case 'No'
                   %%% read but not load pos file
                   StageXY_InitStatus = 1;
                   handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
                   DispSystStatus(handles, 'Stage position file read but not loaded !');
                   DispSystStatus(handles, 'M-126 stages are not initialized !');
            end
         else
            %%% no pos file found 
            StageXY_InitStatus = 2;
            handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
            DispSystStatus(handles, 'Stage position file not found !');
            DispSystStatus(handles, 'M-126 stages are not initialized !'); 
         end  
         %%% Z stage init
         handles.Stages.InitStageZ_LoadPos();
         DispSystStatus(handles, 'ZFM2020 stage is initialized !');
         %%% FZ stage init 
         if file ~= 0
            quest3 = sprintf('Loading Stage FZ positions %3.4f ?', PosLoad(4));
            answer3 = questdlg(quest3,'Init Stage FZ ?','Yes','Return to zero','Return to zero');   
            switch answer3
                case 'Yes'
                   %%% read and load pos file
                   %%% XY Stage connect using PCI 
                   StageFZ_InitStatus = 0;
                   handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus, PosLoad(4)); 
                   DispSystStatus(handles, 'PFM450E stage is initialized !');
                case 'Return to zero'
                   %%% read but not load pos file
                   StageFZ_InitStatus = 1;
                   handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                   DispSystStatus(handles, 'PFM450E stage is initialized !');
            end
         else
            quest4 = sprintf('No saved FZ Stage position found, initialize to zero?');
            answer4 = questdlg(quest4,'Init Stage FZ ?','Yes','No','Yes');   
            switch answer4 
                case 'Yes'
                   %%% Initialize FZ Stage to zero
                   StageFZ_InitStatus = 1;
                   handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                   DispSystStatus(handles, 'PFM450E stage is initialized !');
                case 'No'
                   %%% No pos file found, do not initialize FZ Stage 
                   StageFZ_InitStatus = 2;
                   handles.Stages.InitStageFZ_LoadPos(StageFZ_InitStatus);
                   DispSystStatus(handles, 'PFM450E stage is not initialized !');
            end
         end 
      case 'No'
         %%% XY stage init
         handles.Stages.InitStageXY_Home();
         DispSystStatus(handles, 'M-126 stages are initialized !');
         %%% Z stage init
         handles.Stages.InitStageZ_Home();
         DispSystStatus(handles, 'ZFM2020 stage is initialized !');
         %%% FZ stage init
         handles.Stages.InitStageFZ_Home();
         DispSystStatus(handles, 'PFM450E stage is initialized !');
   end
   %%% Update Stage status display
   UpdateStageStatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'Stages Init Done !');
   %%% Update Eom status display
   UpdateEomStatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'Eom Init Done !');
   %%% Update Galvo status display and FOV size display
   handles.Galvo.DistPerVolt = handles.Galvo.DistPerVoltList(handles.Stages.ObjectiveType);
   handles.Galvo.FOV = handles.Galvo.DistPerVolt*handles.Galvo.VoltRangeX;
   UpdateGalvoStatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'Galvo Init Done !');
   %%% Close all shutters
   handles.Daq.Shutter0_Close();
   handles.Daq.Shutter1_Close();
   handles.Daq.Shutter2_Close();
   ShutterStatusDisp(hObject, eventdata, handles);
   %%% Update data save info
   SavePathRoot = 'E:\Data\';
   listing = dir(SavePathRoot);
   SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')];
   if isempty(find(ismember({listing.name},SaveFolder)))
      mkdir('E:\Data\',SaveFolder);
   else
   end
   handles.Daq.SaveStatus = logical(1); % 0: Not save 1: Save            
   handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
   handles.Daq.SaveFilename = handles.Daq.SaveFilenameList{handles.Daq.DaqMode+1};
   %%% Force mode change for DaqMode configuration
   DaqModeConfig_ForceModeChanOnly(hObject, eventdata, handles);
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
   %%% Update Daq status display
   UpdateDaqStatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'Shutters are initialized !');
   DispSystStatus(handles, 'Daq Init Done !');
   %%%% Initialize CriticalDisplay
   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   set(handles.listbox_PixelSelected,'string',''); 
   %%% Update Camera status display
   UpdateCameraStatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'Camera Init Done !');
   %%% Update SLM status display
   UpdateSLM_StatusDisp(hObject, eventdata, handles);
   DispSystStatus(handles, 'SLM not Initiated !');
   DispSystStatus(handles, 'Data acquisition parameters loaded !');
else
   DispSystStatus(handles, 'No data acquisition parameter file found !'); 
end
%%% Save handles
guidata(hObject, handles);

%%% Load '.mat' or '.tiff' file for SurveyScan image
function pushbutton_LoadSurveyScan_Callback(hObject, eventdata, handles)
[file, path, index] = uigetfile({'*.mat'; '*.tiff'},'Select SurveyScan data file','E:\Data\');
if file ~= 0
   switch index
       case 1 
          Temp = load([path,file]); 
          if numel(fieldnames(Temp))== 1
             handles.Daq.SurveyScanImg = struct2array(Temp);
          else
             handles.Daq.SurveyScanImg = Temp.CI_DataSave;
          end
       case 2
          handles.Daq.SurveyScanImg = double(imread([path,file]));
   end
   %%% Display SurveyScan Image
   handles.CriticalDispMode = [0 0 1 0 0];
   set(handles.radiobutton_SelectCh1,'value',1);
   cla(handles.axes_CriticalDisplay);
   axes(handles.axes_CriticalDisplay);
   if handles.Daq.SurveyScanFtrStatus
      SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
   else
      SurveyScanTemp = handles.Daq.SurveyScanImg;
   end
   handles.Daq.SurveyScanColorbarMin = min(SurveyScanTemp(:));
   if max(SurveyScanTemp(:)) > min(SurveyScanTemp(:))
      handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:));
   else
      handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:))+10; 
   end
   set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
   set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
   h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   %%% Switch to pO2 SurveyScan mode
   %%% Set Modes
   handles.Daq.DaqMode = 2;
   set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
   handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 
   set(handles.radiobutton_RasterScan,'value', 1);
   handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated
   set(handles.radiobutton_Gated,'value', 1);
   handles.Daq.DaqStatus = 0;      % 0: SurveyScan 1: Acq Stack
   set(handles.radiobutton_SurveyScan,'value', 1);
   %%% Set PixelNum
   handles.Galvo.PixelX = size(handles.Daq.SurveyScanImg,2);
   handles.Galvo.PixelY = size(handles.Daq.SurveyScanImg,1);
   set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
   set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
   %%% Set Eom Timing
   handles.Eom.ExcPeriod = 300e-6;
   handles.Eom.GateWidth = 10e-6;
   set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
   set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
   if handles.Eom.NumCycles > 10
      handles.Eom.NumCycles = 1;       
      set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
   else
      handles.Eom.NumCycles = max(handles.Eom.NumCycles,1); 
   end
   handles.Galvo.AO_UpdateRate = 5e4;
   handles.Galvo.AcqDelayTime = 10e-6;
   handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
   handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
   handles.Galvo.NumCycles = handles.Eom.NumCycles;
   handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
   handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;

   set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));
   set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
   set(handles.edit_GalvoAO_UpdateRate,'string', num2str(handles.Galvo.AO_UpdateRate));
   %%% Set Daq parameters
   handles.Daq.PhotonCntrRes = 2e-6;
   set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
   %%% Set AI_ActiveChannel  
   handles.Daq.CI_ActiveStatus = 1;
   handles.Daq.AI_ActiveChannel([3:5,7]) = 0;
   AI_ActiveChannelDisp(hObject, eventdata, handles);
   %%%  Update Eom output
   DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
   DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
   DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
   DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
   DAQStopTask(handles.Eom.AO_Handle);
   %%% If there PO2Pos available, plot them. 
   if ~isempty(handles.Galvo.PO2PosList)
      for i = 1: size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
      end
      set(handles.listbox_PixelSelected,'string', s);
      s_ind = get(handles.listbox_PixelSelected, 'value');
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      set(h_pts,'MarkerSize',8);
      hold off
      set(h_pts,'Tag','axes_CriticalDisplay');
   end  
   h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
   set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
   set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown); 
   %%% Rename image tag
   set(h_img,'Tag','axes_CriticalDisplay');
   %%% Update Savename
   handles.Daq.SaveFilename = handles.Daq.SaveFilenameList{handles.Daq.DaqMode+1};
   set(handles.edit_SaveFilename,'string',handles.Daq.SaveFilename);
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
   DispSystStatus(handles, 'SurveyScan data loaded !');
else
   DispSystStatus(handles, 'No SurveyScan data found !');
end
%%% Save handles
guidata(hObject, handles);

%%% Set X Pos
function edit_SetPosX_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_SetPosX, 'string')))
   handles.Stages.SetPos(1) = str2double(get(handles.edit_SetPosX, 'string'));
   if handles.Stages.SetPos(1)>12500
      handles.Stages.SetPos(1)= 12500;
   elseif handles.Stages.SetPos(1)<-12500
      handles.Stages.SetPos(1)= -12500;
   else
   end
   DispSystStatus(handles, 'Working !');
   handles.Stages.MoveStageX(handles.Stages.SetPos(1));
   set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
   set(handles.edit_SetPosX,'string',num2str(handles.Stages.CurrentPos(1)));
   DispSystStatus(handles, 'Stage X position set !');
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_SetPosX, 'string', num2str(handles.Stages.SetPos(1))); 
end

%%% Set X Step
function edit_StepX_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_StepX, 'string')))
   handles.Stages.StageStep(1) = str2double(get(handles.edit_StepX, 'string'));
   guidata(hObject, handles);
else
   set(handles.edit_StepX, 'string', num2str(handles.Stages.StageStep(1))); 
end

%%% Set X Inc
function pushbutton_IncX_Callback(hObject, eventdata, handles)
PosX_Update = handles.Stages.CurrentPos(1)+ handles.Stages.StageStep(1);
if PosX_Update>12500
   PosX_Update= 12500;
end
DispSystStatus(handles, 'Working !');
handles.Stages.MoveStageX(PosX_Update);
set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
set(handles.edit_SetPosX,'string',num2str(handles.Stages.CurrentPos(1)));
DispSystStatus(handles, 'Stage X moved right !');
%%% Save handles
guidata(hObject, handles);

%%% Set X Dec
function pushbutton_DecX_Callback(hObject, eventdata, handles)
PosX_Update= handles.Stages.CurrentPos(1)- handles.Stages.StageStep(1);
if PosX_Update < -12500
   PosX_Update = -12500;
end
DispSystStatus(handles, 'Working !');
handles.Stages.MoveStageX(PosX_Update);
set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
set(handles.edit_SetPosX,'string',num2str(handles.Stages.CurrentPos(1)));
DispSystStatus(handles, 'Stage X moved left !');
%%% Save handles
guidata(hObject, handles);

%%% Set X Home
function pushbutton_HomeX_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.HomeStageX();
set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
set(handles.edit_SetPosX,'string',num2str(handles.Stages.CurrentPos(1)));
DispSystStatus(handles, 'Stage X moved home !');
%%% Save handles
guidata(hObject, handles);

%%% Set X Stop
function pushbutton_StopX_Callback(hObject, eventdata, handles)
handles.Stages.StopStageX();
set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
set(handles.edit_SetPosX,'string',num2str(handles.Stages.CurrentPos(1)));
DispSystStatus(handles, 'Stage X stopped !');
%%% Save handles
guidata(hObject, handles);

%%% Set Y Pos
function edit_SetPosY_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_SetPosY, 'string')))
   handles.Stages.SetPos(2) = str2double(get(handles.edit_SetPosY, 'string'));
   if handles.Stages.SetPos(2)>12500
      handles.Stages.SetPos(2)= 12500;
   elseif handles.Stages.SetPos(2)<-12500
      handles.Stages.SetPos(2)= -12500;
   else
   end
   DispSystStatus(handles, 'Working !');
   handles.Stages.MoveStageY(handles.Stages.SetPos(2));
   set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
   set(handles.edit_SetPosY,'string',num2str(handles.Stages.CurrentPos(2)));
   DispSystStatus(handles, 'Stage Y position set !');
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_SetPosY, 'string', num2str(handles.Stages.SetPos(2))); 
end

%%% Set Y Step
function edit_StepY_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_StepY, 'string')))
   handles.Stages.StageStep(2) = str2double(get(handles.edit_StepY, 'string'));
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_StepY, 'string', num2str(handles.Stages.StageStep(2)));     
end

%%% Set Y Inc
function pushbutton_IncY_Callback(hObject, eventdata, handles)
PosY_Update= handles.Stages.CurrentPos(2) + handles.Stages.StageStep(2);
if PosY_Update >12500
   PosY_Update = 12500;
end
DispSystStatus(handles, 'Working !');
handles.Stages.MoveStageY(PosY_Update);
set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
set(handles.edit_SetPosY,'string',num2str(handles.Stages.CurrentPos(2)));
DispSystStatus(handles, 'Stage Y moved inward !');
%%% Save handles
guidata(hObject, handles);

%%% Set Y Dec
function pushbutton_DecY_Callback(hObject, eventdata, handles)
PosY_Update= handles.Stages.CurrentPos(2) - handles.Stages.StageStep(2);
if PosY_Update < -12500
   PosY_Update = -12500;
end
DispSystStatus(handles, 'Working !');
handles.Stages.MoveStageY(PosY_Update);
set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
set(handles.edit_SetPosY,'string',num2str(handles.Stages.CurrentPos(2)));
DispSystStatus(handles, 'Stage Y moved outward !');
%%% Save handles
guidata(hObject, handles);

%%% Set Y Home
function pushbutton_HomeY_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.HomeStageY();
set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
set(handles.edit_SetPosY,'string',num2str(handles.Stages.CurrentPos(2)));
DispSystStatus(handles, 'Stage Y moved home !');
%%% Save handles
guidata(hObject, handles);

%%% Set Y Stop
function pushbutton_StopY_Callback(hObject, eventdata, handles)
handles.Stages.StopStageY();
set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
set(handles.edit_SetPosY,'string',num2str(handles.Stages.CurrentPos(2)));
DispSystStatus(handles, 'Stage Y stopped !');
%%% Save handles
guidata(hObject, handles);

%%% Exit or Init StageXY
function pushbutton_ExitXY_Callback(hObject, eventdata, handles)
if handles.Stages.UsageStatus(1)
   %%% Exit StageXY
   handles.Stages.CloseStageXY();
   DispSystStatus(handles, 'M-126 stages are closed !');
else
   %%% Init StageXY
   quest1 = 'Loading saved stage positions?';
   answer1 = questdlg(quest1,'Init stages ?','Yes','No','No');   
   switch answer1
      case 'Yes'
         %%% Load position file  (status = 0 : read and load pos; status = 1 : read but not load pos file; status = 2 : no pos file found.   
         [file path] = uigetfile('*.mat','Select saved stage position file');
         if file ~= 0
            %%% Load file
            PosLoad = struct2array(load([path,file]));
            quest2 = sprintf('Loading Stage XY positions [%5.4f %5.4f]?', PosLoad(1:2));
            answer2 = questdlg(quest2,'Init Stage XY ?','Yes','No','No');   
            switch answer2
                case 'Yes'
                   %%% read and load pos file
                   %%% XY Stage connect using PCI 
                   StageXY_InitStatus = 0;
                   handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus, PosLoad(1:2));
                   DispSystStatus(handles, 'Stage position file read and loaded !');
                   DispSystStatus(handles, 'M-126 stages are initialized !');               
                case 'No'
                   %%% read but not load pos file
                   StageXY_InitStatus = 1;
                   handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
                   DispSystStatus(handles, 'Stage position file read but not loaded !');
                   DispSystStatus(handles, 'M-126 stages are not initialized !');
            end
         else
            %%% no pos file found 
            StageXY_InitStatus = 2;
            handles.Stages.InitStageXY_LoadPos(StageXY_InitStatus);
            DispSystStatus(handles, 'Stage position file not found !');
            DispSystStatus(handles, 'M-126 stages are not initialized !'); 
         end  
      case 'No'
         handles.Stages.InitStageXY_Home();
         DispSystStatus(handles, 'M-126 stages are initialized !');
   end
end
UpdateStageStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set Z Pos
function edit_SetPosZ_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_SetPosZ, 'string')))
   handles.Stages.SetPos(3) = str2double(get(handles.edit_SetPosZ, 'string'));
   if handles.Stages.SetPos(3)>14000
      handles.Stages.SetPos(3)= 14000;
   elseif handles.Stages.SetPos(3)<-14000
      handles.Stages.SetPos(3)= -14000;
   else 
   end
   DispSystStatus(handles, 'Working !');
   handles.Stages.MoveStageZ(handles.Stages.SetPos(3));
   set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
   set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
   DispSystStatus(handles, 'Stage Z position set !');
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_SetPosZ, 'string', num2str(handles.Stages.SetPos(3)));     
end

%%% Set Z Step
function edit_StepZ_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_StepZ, 'string')))
   handles.Stages.StageStep(3) = str2double(get(handles.edit_StepZ, 'string'));
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_StepZ, 'string', num2str(handles.Stages.StageStep(3)));  
end

%%% Set Z Inc
function pushbutton_IncZ_Callback(hObject, eventdata, handles)
handles.Stages.QueryPosStageZ();
DispSystStatus(handles, 'Working !');
PosZ_Update= handles.Stages.CurrentPos(3) + handles.Stages.StageStep(3);
if PosZ_Update > 14000
   PosZ_Update = 14000;
end
handles.Stages.MoveStageZ(PosZ_Update);
set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
DispSystStatus(handles, 'Stage Z moved up !');
%%% Save handles
guidata(hObject, handles);

%%% Set Z Dec
function pushbutton_DecZ_Callback(hObject, eventdata, handles)
handles.Stages.QueryPosStageZ();
DispSystStatus(handles, 'Working !');
PosZ_Update= handles.Stages.CurrentPos(3) - handles.Stages.StageStep(3);
if PosZ_Update < -14000
   PosZ_Update = -14000;
end
handles.Stages.MoveStageZ(PosZ_Update);
set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
DispSystStatus(handles, 'Stage Z moved down !');
%%% Save handles
guidata(hObject, handles);

%%% Set Z Home
function pushbutton_HomeZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.HomeStageZ();
set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
DispSystStatus(handles, 'Stage Z moved home !');
%%% Save handles
guidata(hObject, handles);

%%% Stop Z 
function pushbutton_StopZ_Callback(hObject, eventdata, handles)
handles.Stages.StopStageZ();
set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
DispSystStatus(handles, 'Stage Z stopped !');
%%% Save handles
guidata(hObject, handles);

%%% Exit or Init StageZ
function pushbutton_ExitZ_Callback(hObject, eventdata, handles)
if handles.Stages.UsageStatus(3)
   %%% Exit StageZ
   handles.Stages.CloseStageZ();
   DispSystStatus(handles, 'ZFM2020 stage is closed !');
else
   %%% Init StageZ
   handles.Stages.InitStageZ_LoadPos();
   DispSystStatus(handles, 'ZFM2020 stage is initialized !');
end
UpdateStageStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set FZ Pos
function edit_SetPosFZ_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_SetPosFZ, 'string')))
   handles.Stages.SetPos(4) = str2double(get(handles.edit_SetPosFZ, 'string'));
   if handles.Stages.SetPos(4) < 0
      handles.Stages.SetPos(4) = 0;
   elseif handles.Stages.SetPos(4) > 450
      handles.Stages.SetPos(4)= 450;
   else
   end
   DispSystStatus(handles, 'Working !');
   handles.Stages.MoveStageFZ(handles.Stages.SetPos(4));
   set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
   set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
   DispSystStatus(handles, 'Stage FZ position set !');
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_SetPosFZ, 'string', num2str(handles.Stages.SetPos(4)));         
end

%%% Set FZ Step
function edit_StepFZ_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_StepFZ, 'string')))
   handles.Stages.StageStep(4) = str2double(get(handles.edit_StepFZ, 'string'));
   %%% Save handles
   guidata(hObject, handles);
else
   set(handles.edit_StepFZ, 'string', num2str(handles.Stages.StageStep(4)));      
end

%%% Set FZ Inc
function pushbutton_IncFZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
PosFZ_Update= handles.Stages.CurrentPos(4) + handles.Stages.StageStep(4);
PosFZ_Update = min(PosFZ_Update, 450);
handles.Stages.MoveStageFZ(PosFZ_Update);
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
DispSystStatus(handles, 'Stage FZ moved down !');
%%% Save handles
guidata(hObject, handles);

%%% Set FZ Dec
function pushbutton_DecFZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
PosFZ_Update = handles.Stages.CurrentPos(4) - handles.Stages.StageStep(4);
PosFZ_Update = max(PosFZ_Update,0);
handles.Stages.MoveStageFZ(PosFZ_Update);
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
DispSystStatus(handles, 'Stage FZ moved up !');
%%% Save handles
guidata(hObject, handles);

%%% Set FZ Home
function pushbutton_HomeFZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.HomeStageFZ();
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
DispSystStatus(handles, 'Stage FZ moved home !');
%%% Save handles
guidata(hObject, handles);

%%% Set FZ Stop
function pushbutton_StopFZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.StopStageFZ();
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
DispSystStatus(handles, 'Stage FZ stopped !');
%%% Save handles
guidata(hObject, handles);

%%% Calibrate FZ
function pushbutton_CaliberateFZ_Callback(hObject, eventdata, handles)
DispSystStatus(handles, 'Working !');
handles.Stages.CalibrateStageFZ();
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
DispSystStatus(handles, 'Stage FZ calibrated !');
%%% Save handles
guidata(hObject, handles);

%%% Save Stages Pos
function pushbutton_SavePos_Callback(hObject, eventdata, handles)
SavedPos = handles.Stages.CurrentPos;
save('E:\PLIM_PO2\SaveStagePos\SavedPos.mat','SavedPos');
DispSystStatus(handles, 'Stage positions saved !');
%%% Save handles
guidata(hObject, handles);

%%% Choose objective which will require different FZ PID parameters
function popupmenu_ObjectiveType_Callback(hObject, eventdata, handles)
handles.Stages.ObjectiveType = get(handles.popupmenu_ObjectiveType,'value');
if handles.Stages.UsageStatus(4) == 1
   handles.Stages.StageFZ_ConfigureObj();  
end 
switch handles.Stages.ObjectiveType
    case 1 
       load('E:\PLIM_PO2\CaliStageFZ_20X.mat');
       handles.Stages.StageFZ_CaliP_Input = CaliP_Input;
       handles.Stages.StageFZ_CaliP_Output = CaliP_Output;
       DispSystStatus(handles, 'Stage FZ  configured for 20X objective !');
    case 2
       load('E:\PLIM_PO2\CaliStageFZ_25X.mat'); 
       handles.Stages.StageFZ_CaliP_Input = CaliP_Input;
       handles.Stages.StageFZ_CaliP_Output = CaliP_Output;
       DispSystStatus(handles, 'Stage FZ configured for 25X objective !');    
    case 3
       load('E:\PLIM_PO2\CaliStageFZ_4X.mat'); 
       handles.Stages.StageFZ_CaliP_Input = CaliP_Input;
       handles.Stages.StageFZ_CaliP_Output = CaliP_Output;
       DispSystStatus(handles, 'Stage FZ configured for 4X objective !');     
end
%%% Fov size display
handles.Galvo.DistPerVolt = handles.Galvo.DistPerVoltList(handles.Stages.ObjectiveType);
handles.Galvo.FOV = handles.Galvo.DistPerVolt*handles.Galvo.VoltRangeX;
set(handles.text_SysFOV,'string',['FOV:',num2str(handles.Galvo.FOV,'%.0f'),'um']);
%%% Save handles
guidata(hObject, handles);

%%% Exit or Init StageFZ
function pushbutton_ExitFZ_Callback(hObject, eventdata, handles)
if handles.Stages.UsageStatus(4)
   %%% Exit StageFZ
   handles.Stages.CloseStageFZ();
   DispSystStatus(handles, 'PFM450E stage is closed !');
else
   %%% Init StageFZ
   handles.Stages.InitStageFZ_Home();
   DispSystStatus(handles, 'PFM450E stage is initialized !');
end
UpdateStageStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set BrainSurface
function pushbutton_SetBrainSurface_Callback(hObject, eventdata, handles)
if handles.Daq.BrainSurfaceSetStatus
   handles.Daq.BrainSurfaceSetStatus = 0;
   set(handles.pushbutton_SetBrainSurface,'BackgroundColor',[0.94 0.94 0.94]);
   set(handles.edit_BrainSurfacePosZ,'string',' ');
   set(handles.edit_BrainSurfacePosFZ,'string',' ');
else
   handles.Daq.BrainSurfaceSetStatus = 1;
   set(handles.pushbutton_SetBrainSurface,'BackgroundColor',[1 0 0]);
   handles.Daq.BrainSurfacePosZ = handles.Stages.CurrentPos(3:4);
   set(handles.edit_BrainSurfacePosZ,'string',num2str(handles.Daq.BrainSurfacePosZ(1)));
   set(handles.edit_BrainSurfacePosFZ,'string',num2str(handles.Daq.BrainSurfacePosZ(2)));
end
%%% Save handles
guidata(hObject, handles);

%%% Display BrainSurface PosZ
function edit_BrainSurfacePosZ_Callback(hObject, eventdata, handles)
if handles.Daq.BrainSurfaceSetStatus
   set(handles.edit_BrainSurfacePosZ,'string',num2str(handles.Daq.BrainSurfacePosZ(1)));
else
   set(handles.edit_BrainSurfacePosZ,'string',' ');
end

%%% Display BrainSurface PosFZ
function edit_BrainSurfacePosFZ_Callback(hObject, eventdata, handles)
if handles.Daq.BrainSurfaceSetStatus
   set(handles.edit_BrainSurfacePosFZ,'string',num2str(handles.Daq.BrainSurfacePosZ(2)));
else
   set(handles.edit_BrainSurfacePosFZ,'string',' '); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eom Parameters
%%% Set Eom PeakVoltage
function edit_PeakVoltage_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_PeakVoltage, 'string'));
if val < get(handles.slider_PeakVoltage,'min') 
    val = get(handles.slider_PeakVoltage,'min');
elseif val > get(handles.slider_PeakVoltage,'max') 
    val = get(handles.slider_PeakVoltage,'max');
else 
end
handles.Eom.PeakVoltage = val;

if handles.Eom.CaliStatus
   handles.Eom.PowerPercentage = handles.Eom.VoltToFrac(handles.Eom.PeakVoltage)*100;
else   
end
EomStatusDisp(hObject, eventdata, handles);
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Eom PeakVoltage
function slider_PeakVoltage_Callback(hObject, eventdata, handles)
val = get(handles.slider_PeakVoltage, 'value');
handles.Eom.PeakVoltage = val;
if handles.Eom.CaliStatus
   handles.Eom.PowerPercentage = handles.Eom.VoltToFrac(handles.Eom.PeakVoltage)*100;
else 
end
EomStatusDisp(hObject, eventdata, handles);
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Eom PowerPercentage
function edit_PowerPercentage_Callback(hObject, eventdata, handles)
if handles.Eom.CaliStatus
   val = str2double(get(handles.edit_PowerPercentage, 'string'));
   if val < min(handles.Eom.CaliLUT(:,2))*100
      val = min(handles.Eom.CaliLUT(:,2))*100;
   elseif val > 100
      val = 100;
   else
   end
   handles.Eom.PowerPercentage = val;
   handles.Eom.PeakVoltage = handles.Eom.FracToVolt(val/100);
   EomStatusDisp(hObject, eventdata, handles);
else
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Eom PowerPercentage
function slider_PowerPercentage_Callback(hObject, eventdata, handles)
if handles.Eom.CaliStatus
   val = get(handles.slider_PowerPercentage, 'value');
   handles.Eom.PowerPercentage = val;
   handles.Eom.PeakVoltage = handles.Eom.FracToVolt(handles.Eom.PowerPercentage/100);
   EomStatusDisp(hObject, eventdata, handles);
else
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Eom calibration
function pushbutton_EomCalibration_Callback(hObject, eventdata, handles)
%%% If the main shutter is open, close it
if handles.Daq.ShutterStatus(1)
   if handles.Daq.Shutter0_SilenceStatus
      handles.Daq.Shutter0_SilenceStatus = 0;
      set(handles.pushbutton_SilenceShutterMain, 'BackgroundColor',[0.94 0.94 0.94]);
   else
   end
   handles.Daq.Shutter0_Close(); 
   set(handles.pushbutton_ShutterMain,'BackgroundColor',[0.94 0.94 0.94]);
end
%%% If during Eom bias adjust, exit
if handles.Eom.DriverAdjStatus
   handles.Eom.DriverAdjStatus = 0;
   set(handles.pushbutton_AdjEomDriver, 'BackgroundColor',[0.94 0.94 0.94]);
   cla(handles.axes_CriticalDisplay);
   set(handles.radiobutton_PhotonCntsMoni,'value',0);
   set(handles.text_SurveyScanColorbarMin,'Visible','On');
   set(handles.edit_SurveyScanColorbarMin,'Visible','On');
   set(handles.text_SurveyScanColorbarMax,'Visible','On');
   set(handles.edit_SurveyScanColorbarMax,'Visible','On');
   set(handles.text_PixelInfoCriticalDisp,'Visible','On');

   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   if ~isempty(timerfind)
      stop(timerfind);
      delete(timerfind);
   end
   %%% Stop AI task
   DAQStopTask(handles.Eom.CaliAI_Handle);
end
%%% Set Eom minimum to zero
DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, [0 0]');
DAQStopTask(handles.Eom.AO_Handle);
%%% Measure AI offset first is it is not measured
quest_ans = questdlg('Please close laser shutter for AI offset measurements!','Eom Calibration','OK','Cancel','OK');
%%% Start offset measurement
EomCali_DaqRate = 1e6;
EomCaliPts = 5*EomCali_DaqRate;
EomWaitPts = 100;  %%%  100 us is needed for rise or fall time of Eom
EomCaliRepeat = 3;
AIDelayTicks = 802;
%%% AIDelayTicks = 2302;  %%% EomCali_DaqRate = 1e3
%%% AIDelayTicks = 2202;  %%% EomCali_DaqRate = 1e4
%%% AIDelayTicks = 1202;  %%% EomCali_DaqRate = 1e5
%%% AIDelayTicks = 802;  %%% EomCali_DaqRate = 1e6
if strcmp(quest_ans, 'OK')
   %%% Measuere offset of Eom & shutter is closed
   Offset = handles.Eom.CaliMeasOffset();
   Offset = (-1)^handles.Daq.AI_InverseChannel(0+1)*Offset;
   handles.Eom.Offset = mean(Offset);
   OffsetStd = std(Offset);
   if OffsetStd/handles.Eom.Offset > 0.15
      handles.Eom.NoisyOffsetFlag = 1;
   else
      handles.Eom.NoisyOffsetFlag = 0;
      handles.Eom.OffsetMeasFlag = 1;
   end    
   while handles.Eom.NoisyOffsetFlag
      if handles.Eom.NoisyOffsetFlag
         questtitle = sprintf('Noisy Offset Measured ! (Offset= %2.5f )',handles.Eom.Offset);
         quest_ans2 = questdlg(questtitle,'Offset Measurement','OK','Redo','Redo');
      else
         questtitle = sprintf('Offset Measurement Completed! (Offset= %2.5f )',handles.Eom.Offset);
         quest_ans2 = questdlg(questtitle,'Offset Measurement','OK','Redo','Redo');
      end
      switch quest_ans2
         case 'OK'    
               handles.Eom.NoisyOffsetFlag = 0;
               handles.Eom.OffsetMeasFlag = 1;
         case 'Redo'
               Offset = handles.Eom.CaliMeasOffset();
               Offset = (-1)^handles.Daq.AI_InverseChannel(0+1)*Offset;
               handles.Eom.Offset = mean(Offset);
               OffsetStd = std(Offset);
               if OffsetStd/handles.Eom.Offset > 0.15
                  handles.Eom.NoisyOffsetFlag = 1;
               else
                  handles.Eom.NoisyOffsetFlag = 0; 
               end  
      end
   end
   questtitle = sprintf('Open laser shutter to start Eom calibration (Offset = %2.5f )?',handles.Eom.Offset);
   quest_ans3 = questdlg(questtitle,'Eom Calibration','Yes','No','Yes');
   if strcmp(quest_ans3, 'Yes')
      %%% Waitbar configuration
      EomCaliWaitbar = waitbar(0,'Calibrating Eom output !');
      %%% Configre AO task for Eom calibration
      EomCaliVoltCosPeriod = (handles.Eom.CaliMaxVolt+handles.Eom.CaliMinVolt)/2+(handles.Eom.CaliMaxVolt-handles.Eom.CaliMinVolt)/2*cos(2*pi/EomCaliPts*(0:EomCaliPts-1)+pi);
      EomCaliVoltWritePeriod = [EomCaliVoltCosPeriod'; zeros(EomWaitPts,1)];      
      EomCaliVoltWrite = repmat(EomCaliVoltWritePeriod, [EomCaliRepeat 1]);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', EomCali_DaqRate, size(EomCaliVoltWrite,1));
      DAQWriteAnalogF64(handles.Eom.AO_Handle, size(EomCaliVoltWrite,1), 0, EomCaliVoltWrite);
      DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle, '/PXI1Slot2/PFI1', DAQmx_Val_Rising);
      DAQSetStartTrigRetriggerable(handles.Eom.CaliAI_Handle, 0);
      %%% Configure AI task for Eom calibration
      EomCaliVoltRead = zeros(size(EomCaliVoltWrite));
      DAQCfgSampClkTimingFiniSamps(handles.Eom.CaliAI_Handle,' ', EomCali_DaqRate, size(EomCaliVoltRead,1));
      DAQCfgDigEdgeStartTrig(handles.Eom.CaliAI_Handle,'/PXI1Slot2/ao/StartTrigger', DAQmx_Val_Rising);
      DAQSetStartTrigRetriggerable(handles.Eom.CaliAI_Handle, 0);
      DAQSetStartTrigDelayUnits(handles.Eom.CaliAI_Handle, DAQmx_Val_Ticks);
      DAQSetStartTrigDelay(handles.Eom.CaliAI_Handle, AIDelayTicks);
      %%% Start tasks
      DAQStartTask(handles.Eom.AO_Handle);
      DAQStartTask(handles.Eom.CaliAI_Handle);
      DAQWriteDigitalLines(handles.Eom.CaliStartTrig_Handle, 1);
      %%%%% Acquire data
      for i = 1:EomCaliRepeat
          pause((EomCaliPts+EomWaitPts)/EomCali_DaqRate);
          waitbar(i/EomCaliRepeat, EomCaliWaitbar,'Calibrating Eom output !');
      end
      %%% Read AI data & stop tasks
      EomCaliVoltRead = DAQReadAnalogF64(handles.Eom.CaliAI_Handle, size(EomCaliVoltRead,1), EomCaliVoltRead);
      DAQStopTask(handles.Eom.AO_Handle);
      DAQStopTask(handles.Eom.CaliAI_Handle);
      DAQWriteDigitalLines(handles.Eom.CaliStartTrig_Handle, 0); 
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, [0 0]');
      DAQStopTask(handles.Eom.AO_Handle);
      %%% Process & save data
      EomCaliVoltRead = (-1)^handles.Daq.AI_InverseChannel(0+1)*EomCaliVoltRead;
      EomCaliVoltRead = EomCaliVoltRead - handles.Eom.Offset;
      EomCaliVoltTemp = zeros(EomCaliPts, 1);
      for i = 1: EomCaliPts
          for j = 1: EomCaliRepeat
              EomCaliVoltTemp(i) = EomCaliVoltTemp(i)+ EomCaliVoltRead((j-1)*(EomCaliPts+EomWaitPts)+i);
          end
          EomCaliVoltTemp(i) = EomCaliVoltTemp(i)/EomCaliRepeat;
      end
      EomCaliVolt = (EomCaliVoltTemp(1:end/2)+flip(EomCaliVoltTemp(end/2+1:end)))/2;
      EomCaliVolt(EomCaliVolt < 0) = 0;
      EomCaliVoltMin = min(EomCaliVolt);
      EomCaliVoltMax = max(EomCaliVolt);
      %%% Extinction ratio 
      handles.Eom.ExtRatio = EomCaliVoltMax/EomCaliVoltMin;
      %%% LUT creation
      EomCaliVoltMinInd = find(EomCaliVolt == EomCaliVoltMin,1,'last');
      EomCaliVoltMaxInd = find(EomCaliVolt == EomCaliVoltMax,1,'last');
      EomCaliVoltWriteCrop = EomCaliVoltWrite(EomCaliVoltMinInd:EomCaliVoltMaxInd);
      EomCaliVoltWriteInterp = linspace(EomCaliVoltWrite(EomCaliVoltMinInd), EomCaliVoltWrite(EomCaliVoltMaxInd),5000)';
      EomCaliVoltReadCrop = EomCaliVolt(EomCaliVoltMinInd:EomCaliVoltMaxInd);
      EomCaliVoltReadInterp = interp1(EomCaliVoltWriteCrop, EomCaliVoltReadCrop, EomCaliVoltWriteInterp, 'spline');
      CaliLUT = [EomCaliVoltWriteInterp EomCaliVoltReadInterp/max(EomCaliVoltReadInterp)];
      close(EomCaliWaitbar);
      %%% Load laser wavelength
      prompt = {'Enter laser wavelength (nm):'};
      dlgtitle = 'Input laser wavelength (nm)';
      dims = [1 30];
      answerinput = inputdlg(prompt,dlgtitle,dims);
      wavelength = cell2mat(answerinput);
      %%% Plot LUT
      h = figure;
      plot(EomCaliVoltWriteInterp, EomCaliVoltReadInterp/max(EomCaliVoltReadInterp)*100, 'LineWidth', 2);
      title(['Eom Control LUT at ', wavelength, 'nm']);
      xlabel('Eom Input Voltage (V)');
      ylabel('Percentage Output Power (%)');
      grid on
      text(0.05, 90, sprintf('Offset = %2.5f', handles.Eom.Offset));
      text(0.05, 80, sprintf('CaliVoltMax = %2.5f', EomCaliVoltMax));
      text(0.05, 70, sprintf('CaliVoltMin = %2.5f', EomCaliVoltMin));
      text(0.05, 60, sprintf('Extiction Ratio = %d', round(handles.Eom.ExtRatio)));
      %%% Accept save results 
      quest_ans4 = questdlg('Accept and save Eom cali results?','Eom cali','Yes','No','No');
      switch quest_ans4
          case 'Yes'  
             %%% Save LUT
             handles.Eom.CaliLUT = CaliLUT;
             handles.Eom.CaliStatus = 1;
             %%% Update Eom status display and waveform
             set(handles.slider_PeakVoltage,'max',max(EomCaliVoltWriteInterp));
             set(handles.slider_PeakVoltage,'min',min(EomCaliVoltWriteInterp));
             set(handles.slider_PowerPercentage, 'min', min(CaliLUT(:,2))*100);
             handles.Eom.FracMiniOutput = min(CaliLUT(:,2));
             MiniFracInd = find(CaliLUT(:,2) == handles.Eom.FracMiniOutput, 1, 'last');
             handles.Eom.VoltMiniInput = CaliLUT(MiniFracInd,1);
             handles.Eom.PeakVoltage = handles.Eom.VoltMiniInput;
             handles.Eom.PowerPercentage = handles.Eom.FracMiniOutput*100;
             EomStatusDisp(hObject, eventdata, handles); 
             %%% Disable laser direct output
             handles.Eom.LaserOutStatus = 0;
             set(handles.radiobutton_LaserOutStatus,'value',handles.Eom.LaserOutStatus);
             %%% Configure DaqMode
             DaqModeConfig(hObject, eventdata, handles); 
             %%% Save file in default calibration folder
             datetimestr = datestr(now,'HHMMSS');
             %%% Save file in data folder
             if exist(handles.Daq.SavePath, 'dir')==7
             else
                SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                mkdir('E:\Data\',SaveFolder);
                handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
             end
             Savenamemat = [handles.Daq.SavePath, 'EomLUT_', wavelength,'_', datetimestr,'.mat'];
             save(Savenamemat,'CaliLUT');
             Savenamefig = [handles.Daq.SavePath, 'EomLUT_', wavelength,'_', datetimestr,'.fig'];
             savefig(h,Savenamefig);
             close(h);
          case 'No'
             close(h);
      end     
   end
else          %%% Start calibration directly if Offset is measured
   if handles.Eom.OffsetMeasFlag      %%% AI offset measured, start Eom calibration w/o offset measurement
      questtitle = sprintf('Open laser shutter to start Eom calibration (Offset = %2.5f )?',handles.Eom.Offset);
      quest_ans3 = questdlg(questtitle,'Eom Calibration','Yes','No','Yes');
      if strcmp(quest_ans3, 'Yes')
         %%% Waitbar configuration
         EomCaliWaitbar = waitbar(0,'Calibrating Eom output !');
         %%% Configre AO task for Eom calibration
         EomCaliVoltCosPeriod = (handles.Eom.CaliMaxVolt+handles.Eom.CaliMinVolt)/2+(handles.Eom.CaliMaxVolt-handles.Eom.CaliMinVolt)/2*cos(2*pi/EomCaliPts*(0:EomCaliPts-1)+pi);
         EomCaliVoltWritePeriod = [EomCaliVoltCosPeriod'; zeros(EomWaitPts,1)];
         EomCaliVoltWrite = repmat(EomCaliVoltWritePeriod, [EomCaliRepeat 1]);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', EomCali_DaqRate, size(EomCaliVoltWrite,1));
         DAQWriteAnalogF64(handles.Eom.AO_Handle, size(EomCaliVoltWrite,1), 0, EomCaliVoltWrite);
         DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle, '/PXI1Slot2/PFI1', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Eom.CaliAI_Handle, 0);
         %%% Configure AI task for Eom calibration
         EomCaliVoltRead = zeros(size(EomCaliVoltWrite));
         DAQCfgSampClkTimingFiniSamps(handles.Eom.CaliAI_Handle,' ', EomCali_DaqRate, size(EomCaliVoltRead,1));
         DAQCfgDigEdgeStartTrig(handles.Eom.CaliAI_Handle,'/PXI1Slot2/ao/StartTrigger', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Eom.CaliAI_Handle, 0);
         DAQSetStartTrigDelayUnits(handles.Eom.CaliAI_Handle, DAQmx_Val_Ticks);
         DAQSetStartTrigDelay(handles.Eom.CaliAI_Handle, AIDelayTicks);
         %%% Start tasks
         DAQStartTask(handles.Eom.AO_Handle);
         DAQStartTask(handles.Eom.CaliAI_Handle);
         DAQWriteDigitalLines(handles.Eom.CaliStartTrig_Handle, 1); 
         %%%%% Acquire data
         for i = 1:EomCaliRepeat
             pause((EomCaliPts+EomWaitPts)/EomCali_DaqRate);
             waitbar(i/EomCaliRepeat, EomCaliWaitbar,'Calibrating Eom output !');
         end
         %%% Read AI data & stop tasks
         EomCaliVoltRead = DAQReadAnalogF64(handles.Eom.CaliAI_Handle, size(EomCaliVoltRead,1), EomCaliVoltRead);
         EomCaliVoltRead = (-1)^handles.Daq.AI_InverseChannel(0+1)*EomCaliVoltRead;
         DAQStopTask(handles.Eom.AO_Handle);
         DAQStopTask(handles.Eom.CaliAI_Handle);
         DAQWriteDigitalLines(handles.Eom.CaliStartTrig_Handle, 0); 
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, [0 0]');
         DAQStopTask(handles.Eom.AO_Handle);
         %%% Process & save data
         EomCaliVoltRead = EomCaliVoltRead - handles.Eom.Offset;
         EomCaliVoltTemp = zeros(EomCaliPts, 1);
         for i = 1: EomCaliPts
             for j = 1: EomCaliRepeat
                 EomCaliVoltTemp(i) = EomCaliVoltTemp(i)+ EomCaliVoltRead((j-1)*(EomCaliPts+EomWaitPts)+i);
             end
             EomCaliVoltTemp(i) = EomCaliVoltTemp(i)/EomCaliRepeat;
         end
         EomCaliVolt = (EomCaliVoltTemp(1:end/2)+flip(EomCaliVoltTemp(end/2+1:end)))/2;
         EomCaliVolt(EomCaliVolt < 0) = 0;
         EomCaliVoltMin = min(EomCaliVolt);
         EomCaliVoltMax = max(EomCaliVolt);
         %%% Extinction ratio 
         handles.Eom.ExtRatio = EomCaliVoltMax/EomCaliVoltMin;
         %%% LUT creation
         EomCaliVoltMinInd = find(EomCaliVolt == EomCaliVoltMin,1,'last');
         EomCaliVoltMaxInd = find(EomCaliVolt == EomCaliVoltMax,1,'last');
         EomCaliVoltWriteCrop = EomCaliVoltWrite(EomCaliVoltMinInd:EomCaliVoltMaxInd);
         EomCaliVoltWriteInterp = linspace(EomCaliVoltWrite(EomCaliVoltMinInd), EomCaliVoltWrite(EomCaliVoltMaxInd),5000)';
         EomCaliVoltReadCrop = EomCaliVolt(EomCaliVoltMinInd:EomCaliVoltMaxInd);
         EomCaliVoltReadInterp = interp1(EomCaliVoltWriteCrop, EomCaliVoltReadCrop, EomCaliVoltWriteInterp, 'spline');
         CaliLUT = [EomCaliVoltWriteInterp EomCaliVoltReadInterp/max(EomCaliVoltReadInterp)];
         close(EomCaliWaitbar);
         %%% Load laser wavelength
         prompt = {'Enter laser wavelength (nm):'};
         dlgtitle = 'Input laser wavelength (nm)';
         dims = [1 30];
         answerinput = inputdlg(prompt,dlgtitle,dims);
         wavelength = cell2mat(answerinput);
         %%% Plot LUT
         h = figure;
         plot(EomCaliVoltWriteInterp, EomCaliVoltReadInterp/max(EomCaliVoltReadInterp)*100, 'LineWidth', 2);
         title(['Eom Control LUT at ', wavelength, 'nm']);
         xlabel('Eom Input Voltage (V)');
         ylabel('Percentage Output Power (%)');
         grid on
         text(0.05, 90, sprintf('Offset = %2.5f', handles.Eom.Offset));
         text(0.05, 80, sprintf('CaliVoltMax = %2.5f', EomCaliVoltMax));
         text(0.05, 70, sprintf('CaliVoltMin = %2.5f', EomCaliVoltMin));
         text(0.05, 60, sprintf('Extiction Ratio = %d', round(handles.Eom.ExtRatio)));
         %%% Accept save results 
         quest_ans4 = questdlg('Accept and save Eom cali results?','Eom cali','Yes','No','No');
         switch quest_ans4
             case 'Yes'  
                %%% Save LUT
                handles.Eom.CaliLUT = CaliLUT;
                handles.Eom.CaliStatus = 1;
                %%% Update Eom status display and waveform
                set(handles.slider_PeakVoltage,'max',max(EomCaliVoltWriteInterp));
                set(handles.slider_PeakVoltage,'min',min(EomCaliVoltWriteInterp));
                set(handles.slider_PowerPercentage, 'min', min(CaliLUT(:,2))*100);
                handles.Eom.FracMiniOutput = min(CaliLUT(:,2));
                MiniFracInd = find(CaliLUT(:,2) == handles.Eom.FracMiniOutput, 1, 'last');
                handles.Eom.VoltMiniInput = CaliLUT(MiniFracInd,1);
                handles.Eom.PeakVoltage = handles.Eom.VoltMiniInput;
                handles.Eom.PowerPercentage = handles.Eom.FracMiniOutput*100;
                EomStatusDisp(hObject, eventdata, handles); 
                %%% Disable laser direct output
                handles.Eom.LaserOutStatus = 0;
                set(handles.radiobutton_LaserOutStatus,'value',handles.Eom.LaserOutStatus);
                %%% Configure DaqMode
                DaqModeConfig(hObject, eventdata, handles); 
                %%% Save file in data folder
                datetimestr = datestr(now,'HHMMSS');
                Savenamemat = [handles.Daq.SavePath, 'EomLUT_', wavelength,'_', datetimestr,'.mat'];
                save(Savenamemat,'CaliLUT');
                Savenamefig = [handles.Daq.SavePath, 'EomLUT_', wavelength,'_', datetimestr,'.fig'];
                savefig(h,Savenamefig);
                close(h);
             case 'No'
                close(h);
         end     
      end  
   else
      return; 
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Set Eom bias
function pushbutton_AdjEomDriver_Callback(hObject, eventdata, handles)
if handles.Eom.DriverAdjStatus
   handles.Eom.DriverAdjStatus = 0;
   set(handles.pushbutton_AdjEomDriver, 'BackgroundColor',[0.94 0.94 0.94]);
   cla(handles.axes_CriticalDisplay);
   title(handles.axes_CriticalDisplay,' ');
   set(handles.radiobutton_PhotonCntsMoni,'value',0);
   set(handles.text_SurveyScanColorbarMin,'Visible','On');
   set(handles.edit_SurveyScanColorbarMin,'Visible','On');
   set(handles.text_SurveyScanColorbarMax,'Visible','On');
   set(handles.edit_SurveyScanColorbarMax,'Visible','On');
   set(handles.text_PixelInfoCriticalDisp,'Visible','On');

   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   if ~isempty(timerfind)
      stop(timerfind);
      delete(timerfind);
   end
   %%% Stop AI task
   DAQStopTask(handles.Eom.CaliAI_Handle);
else
   quest_ans = questdlg('Adjusting driver bias voltage to get minimum Eom output ?','Eom driver adjustment','Yes','No','No');
   switch quest_ans
      case 'Yes'    
         handles.Eom.CaliStatus = 0;
         handles.Eom.CaliLUT = []; 
         handles.Eom.DriverAdjStatus = 1;
         set(handles.pushbutton_AdjEomDriver, 'BackgroundColor',[1 0 0]);
         set(handles.text_SurveyScanColorbarMin,'Visible','Off');
         set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
         set(handles.text_SurveyScanColorbarMax,'Visible','Off');
         set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
         set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
         handles.CriticalDispMode = [0 1 0 0 0];
         set(handles.radiobutton_PhotonCntsMoni,'value',1);
         %%% Set AO  Eom input to 0
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, [0 0]');
         DAQStopTask(handles.Eom.AO_Handle);
         %%% Set AI
         DAQSetStartTrigType(handles.Eom.CaliAI_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.CaliAI_Handle,' ', 1e6, 500);
         %%% Set timer
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         t_EomAI = timer;
         t_EomAI.StartDelay = 0;
         t_EomAI.TimerFcn = {@AdjEomDriverReadAI, handles};
         t_EomAI.ExecutionMode = 'fixedRate';
         t_EomAI.Period = 0.5;
         start(t_EomAI);
      case 'No'
         return;
   end
end
%%% Save handles
guidata(hObject, handles);

%%% AI reading function for Eom bias adjust
function varargout = AdjEomDriverReadAI(~,~, handles)
DAQStartTask(handles.Eom.CaliAI_Handle);
ReadTemp = zeros(500,1);
ReadTemp = DAQReadAnalogF64(handles.Eom.CaliAI_Handle, 500, ReadTemp);
ReadTemp = (-1)^handles.Daq.AI_InverseChannel(0+1)*ReadTemp;
plot(handles.axes_CriticalDisplay,ReadTemp,'b-');
axis(handles.axes_CriticalDisplay,[1 500 mean(ReadTemp)*0.8 mean(ReadTemp)*1.2]);
set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
title(handles.axes_CriticalDisplay,'Eom output for driver bias adjustment');
xlabel(handles.axes_CriticalDisplay,'Data Pts', 'FontSize', 8);
ylabel(handles.axes_CriticalDisplay,'Eom output (V)','FontSize', 8);
DAQStopTask(handles.Eom.CaliAI_Handle);

%%% Eom loading calibration LUT
function pushbutton_EomLoad_Callback(hObject, eventdata, handles)
%%% Load calibrated EOM characterizatio LUT
[file path] = uigetfile('E:\Data\*.mat','Select Eom clibration LUT file');
if file ~= 0
   %%% Load file
   CaliLUTLoad = struct2array(load([path,file]));
   handles.Eom.CaliLUT = CaliLUTLoad;
   DispSystStatus(handles, 'Eom calibration LUT loaded !');
   handles.Eom.CaliStatus = 1;
   %%% Get Eom Volt & Frac parameters & set Eom to minimum
   handles.Eom.FracMiniOutput = min(CaliLUTLoad(:,2));
   handles.Eom.VoltMiniInput = handles.Eom.FracToVolt(handles.Eom.FracMiniOutput);
   set(handles.slider_PeakVoltage,'max',max(CaliLUTLoad(:,1)));
   set(handles.slider_PeakVoltage,'min',min(CaliLUTLoad(:,1)));
   set(handles.slider_PowerPercentage, 'min', handles.Eom.FracMiniOutput*100);
   handles.Eom.PeakVoltage = handles.Eom.VoltMiniInput;
   handles.Eom.PowerPercentage = handles.Eom.FracMiniOutput*100;
   EomStatusDisp(hObject, eventdata, handles);
   %%% Disable laser direct output
   handles.Eom.LaserOutStatus = 0;
   set(handles.radiobutton_LaserOutStatus,'value',handles.Eom.LaserOutStatus);
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles);   
else
   DispSystStatus(handles, 'No Eom calibration LUT found !');
end
%%% Save handles
guidata(hObject, handles);

%%% Set Eom ExcPeriod 
function edit_ExcPeriod_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_ExcPeriod,'string')))
   val = round(str2double(get(handles.edit_ExcPeriod, 'string')));
   if handles.Eom.PowerMode == 1  %%% 0: CW; 1: TD 
      val = max(val, 300);
      handles.Eom.ExcPeriod = val/1e6;
      set(handles.edit_ExcPeriod, 'string', num2str(val));
      handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
      handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
      handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
      set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));
      handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
      %%% Set PhotonCntrRes
      if mod(handles.Eom.ExcPeriod*1e6, handles.Daq.PhotonCntrRes*1e6)==0
      else
         ExcPeriodDivisor = divisors(handles.Eom.ExcPeriod*1e6); 
         DivisorInd = find(abs(ExcPeriodDivisor-handles.Daq.PhotonCntrRes*1e6)==min(abs(ExcPeriodDivisor-handles.Daq.PhotonCntrRes*1e6)),1,'first');
         handles.Daq.PhotonCntrRes = ExcPeriodDivisor(DivisorInd)/1e6;
         set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
      end
      %%% Configure DaqMode
      DaqModeConfig(hObject, eventdata, handles);   
   else
      set(handles.edit_ExcPeriod, 'string', num2str(handles.Eom.ExcPeriod*1e6));
   end 
else
   set(handles.edit_ExcPeriod, 'string', num2str(handles.Eom.ExcPeriod*1e6)); 
end
%%% Save handles
guidata(hObject, handles);

%%% Set Eom GateWidth
function edit_GateWidth_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_GateWidth,'string')))
   val = str2double(get(handles.edit_GateWidth, 'string'));
   if handles.Eom.PowerMode == 1
      if (val/1e6) < handles.Eom.ExcPeriod
         handles.Eom.GateWidth = val/1e6;
      else
         handles.Eom.GateWidth = 10e-6; 
         set(handles.edit_GateWidth, 'string', num2str(handles.Eom.GateWidth*1e6));
      end
      %%% Configure DaqMode
      DaqModeConfig(hObject, eventdata, handles);    
   else
      set(handles.edit_GateWidth, 'string', num2str(handles.Eom.GateWidth*1e6));
   end
else
   set(handles.edit_GateWidth, 'string', num2str(handles.Eom.GateWidth*1e6)); 
end
%%% Save handles
guidata(hObject, handles);

%%% Set Eom NumCycles
function edit_NumCycles_Callback(hObject, eventdata, handles)
val = round(str2double(get(hObject, 'string')));
if handles.Eom.PowerMode == 1 
   if handles.Daq.DaqStatus==0
      handles.Eom.NumCycles = min(val,10); 
   else   
      handles.Eom.NumCycles = min(val,3000); 
   end
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
   handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
   
   handles.Galvo.NumCycles = handles.Eom.NumCycles;
   handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
   set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));

   handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles);   
else
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles);    
end
%%% Save handles
guidata(hObject, handles);

%%% Set PowerMode
function uibuttongroup_PowerMode_SelectionChangedFcn(hObject, eventdata, handles)
if get(handles.radiobutton_CW, 'value')
   handles.Eom.PowerMode = 0;
else   %%% get(handles.radiobutton_Gated, 'value')
   handles.Eom.PowerMode = 1;
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set Eom AO_UpdateRate
function edit_EomAO_UpdateRate_Callback(hObject, eventdata, handles)
handles.Eom.AO_UpdateRate = 2e6;
set(handles.edit_EomAO_UpdateRate,'string',num2str(handles.Eom.AO_UpdateRate));  
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Eom AI Invert
function radiobutton_InvertEomAI_Callback(hObject, eventdata, handles)
handles.Daq.AI_InverseChannel(0+1) = get(handles.radiobutton_InvertEomAI,'value');
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Galvo Parameters
%%% Set PixelDwellTime
function edit_PixelDwellTime_Callback(hObject, eventdata, handles)
val = round(str2double(get(handles.edit_PixelDwellTime, 'string')));
if any(handles.Daq.DaqMode == [0 1])
   switch handles.Daq.AI_SampleRate
       case 1e6 
          if handles.Galvo.AO_UpdateRate == 5e5
             handles.Daq.SamplePerPx = max(ceil(val/2)*2,2); 
             handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
          else %%% handles.Galvo.AO_UpdateRate == 8e5
             handles.Daq.SamplePerPx = max(ceil(val/5)*5,5);
             handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
          end
       case 1.25e6
          handles.Daq.SamplePerPx = max(ceil(val/5)*5,5); 
          handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
   end
   set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6)); 
   set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
elseif any(handles.Daq.DaqMode == [3 4 5])
   handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate; 
   set(handles.edit_PixelDwellTime, 'string',num2str(handles.Eom.PixelDwellTime*1e6)); 
else
    
end
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
guidata(hObject, handles);

%%% Set BidirectionScan (Data acq not ready)
function radiobutton_BidirectionScan_Callback(hObject, eventdata, handles)
val = get(handles.radiobutton_BidirectionScan, 'value');
handles.Galvo.BidirectionScan = logical(val);
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set ScanMode
function uibuttongroup_ScanMode_SelectionChangedFcn(hObject, eventdata, handles)
val0 = get(handles.radiobutton_RasterScan, 'value');
val1 = get(handles.radiobutton_MultiPointsGalvo, 'value');
handles.Galvo.ScanMode = find([val0 val1])-1; 
DaqModeConfig(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo VoltRangeX
function edit_VoltRangeX_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_VoltRangeX, 'string'));
if val >= 0 & val <= 10
else
   val = max(val,0);
   val = min(val,10);
end
if handles.Galvo.SquFOV_Status
   handles.Galvo.VoltRangeX = val;
   handles.Galvo.VoltRangeY = val;
   set(handles.edit_VoltRangeY,'string',num2str(handles.Galvo.VoltRangeY));
else
   handles.Galvo.VoltRangeX = val;
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Fov size display
handles.Galvo.DistPerVolt = handles.Galvo.DistPerVoltList(handles.Stages.ObjectiveType);
handles.Galvo.FOV = handles.Galvo.DistPerVolt*handles.Galvo.VoltRangeX;
set(handles.text_SysFOV,'string',['FOV:',num2str(handles.Galvo.FOV,'%.0f'),'um']);
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo PixelX
function edit_PixelX_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_PixelX, 'string'));
if handles.Galvo.SquFOV_Status
   handles.Galvo.PixelX = round(val);
   handles.Galvo.PixelY = round(val);
   set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
else    
   handles.Galvo.PixelX = round(val);
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo VoltOffset
function edit_VoltOffsetX_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_VoltOffsetX, 'string'));
handles.Galvo.VoltOffsetX = val;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo VoltRangeY
function edit_VoltRangeY_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_VoltRangeY, 'string'));
if val >= 0 & val <= 10
else
   val = max(val,0);
   val = min(val,10);
end
if handles.Galvo.SquFOV_Status
   handles.Galvo.VoltRangeY = val;
   handles.Galvo.VoltRangeX = val;
   set(handles.edit_VoltRangeX,'string',num2str(handles.Galvo.VoltRangeX));
else
   handles.Galvo.VoltRangeY = val;
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Fov size display
handles.Galvo.DistPerVolt = handles.Galvo.DistPerVoltList(handles.Stages.ObjectiveType);
handles.Galvo.FOV = handles.Galvo.DistPerVolt*handles.Galvo.VoltRangeX;
set(handles.text_SysFOV,'string',['FOV:',num2str(handles.Galvo.FOV,'%.0f'),'um']);
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo PixelY
function edit_PixelY_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_PixelY, 'string'));
if handles.Galvo.SquFOV_Status
   handles.Galvo.PixelY = round(val);
   handles.Galvo.PixelX = round(val);
   set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
else    
   handles.Galvo.PixelY = round(val);
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo VoltOffsetY
function edit_VoltOffsetY_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_VoltOffsetY, 'string'));
handles.Galvo.VoltOffsetY = val;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Tune acq delay (using angiogram surveyscan to tune acq delay time)
function pushbutton_TuneAcqDelay_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   set(handles.pushbutton_TuneAcqDelay,'BackgroundColor',[1 0 0]); 
   %%%  Initial delays
   GalvoInitDelayTime = 2e-8;
   %%%  Acquire X position for tuning of handles.Galvo.AcqDelayTime
   RampFlag = 1;
   RepeatTemp = 0;
   AcqWaitbar = waitbar(0,'Recording XYZ positions for tuning !','Name','Data acquisition progress');
   while RampFlag == 1
      AI_InitDelayTime = handles.Galvo.GalvoFlybackTime + handles.Galvo.AcqDelayTime;  
      %%%  Configure tasks
      %%%  AO task for Galvo
      SequenceSize = 2*size(handles.Galvo.WaveformX,1);
      GalvoWaveform = int16(zeros(SequenceSize,1));
      for i = 1:2:SequenceSize-1
          GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
          GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
      end
      DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1));
      DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
      DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);
      DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Seconds);
      DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTime);
      DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1), 0, GalvoWaveform);       
      %%%  AO task for Eom Static Output
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
      %%%  AI task
      AI_ScalingCoeff = []; 
      AI_AcqChannel = [5 6 7];
      AI_ReadChannel = ' ';
      for i = 1: length(AI_AcqChannel)
          ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
          if i ~= length(AI_AcqChannel)
             AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
          else
             AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
          end
          DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
          DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
          AI_ScalingCoeff = [AI_ScalingCoeff; DAQGetAIDevScalingCoeff(handles.Daq.AI_Handle, ActiveChannel)];
      end
      DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);
      AI_SamplePerChan = round((handles.Galvo.FrameLength-handles.Galvo.FrameRetraceLength)/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
      AI_SampleAllChan = AI_SamplePerChan*length(AI_AcqChannel);
      AI_Data = int16(zeros(AI_SampleAllChan, 1));
      DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SamplePerChan);
      DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_DigEdge);
      DAQCfgDigEdgeStartTrig(handles.Daq.AI_Handle,'/PXI1Slot3/ao/StartTrigger',DAQmx_Val_Rising);
      DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
      DAQSetStartTrigDelayUnits(handles.Daq.AI_Handle, DAQmx_Val_Seconds);
      DAQSetStartTrigDelay(handles.Daq.AI_Handle, AI_InitDelayTime);
      %%%  Start tasks (all shutters off)    
      DAQStartTask(handles.Daq.AI_Handle);
      DAQStartTask(handles.Galvo.AO_Handle);
      DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
      %%% Wait until done and read data
      for i = 1: 3
          pause(handles.Galvo.FrameLength/handles.Galvo.AO_UpdateRate/3);
          waitbar(i/3, AcqWaitbar,'Recording XYZ positions for tuning !'); 
      end
      DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
      AI_Data = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SamplePerChan, AI_Data);
      %%% stop tasks
      DAQStopTask(handles.Galvo.AO_Handle);  
      DAQStopTask(handles.Daq.AI_Handle);
      %%% Reset start trigger
      DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
      %%% Process, display and save data 
      %%%% Retrieve data
      AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)));
      AI_ImageRepLength = round(AI_SamplePerChan/handles.Daq.DaqRepeat);
      AI_ImageLineLength = round(AI_SamplePerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
      AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
      AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
      AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
      for i = 1: length(AI_AcqChannel)
          AI_DataTemp = AI_Data(i:length(AI_AcqChannel):end);
          for j = 1: handles.Galvo.PixelY
              for k = 1: handles.Galvo.PixelX
                  AI_DataTemp2 = 0;
                  for p = 1: handles.Daq.DaqRepeat
                      AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                             +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
                  end    
                  AI_SaveData(j, k, i) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
              end
           end
           AI_Volt(:,:,i) = AI_ScalingCoeff(i,1)+AI_ScalingCoeff(i,2)*double(AI_SaveData(:,:,i))+AI_ScalingCoeff(i,3)*double(AI_SaveData(:,:,i).^2)+AI_ScalingCoeff(i,4)*double(AI_SaveData(:,:,i).^3);
           AI_SaveData(:,:,i) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_Volt(:,:,i)/2/handles.Daq.AI_Range(AI_AcqChannel(i)+1)*2^16);
      end         
      AI_GalvoX = AI_SaveData(:,:,1);
      AI_GalvoX_Mean = mean(AI_GalvoX, 1);
      if isempty(find(diff(sign(diff(AI_GalvoX_Mean))))+1)
         RepeatTemp = RepeatTemp + 1;
         AI_GalvoX_Min = min(AI_GalvoX_Mean);
         AI_GalvoX_Max = max(AI_GalvoX_Mean);
         AI_PixelAdjust = (abs(AI_GalvoX_Max) - abs(AI_GalvoX_Min))*handles.Galvo.PixelX/(AI_GalvoX_Max-AI_GalvoX_Min)/2;
         AI_TimeAdjust = AI_PixelAdjust*handles.Daq.PixelDwellTime;
         handles.Galvo.AcqDelayTime = handles.Galvo.AcqDelayTime - AI_TimeAdjust;
         if RepeatTemp == 2
            RampFlag = 0;
            waitbar(0,AcqWaitbar,'Processing data for delay time tuning !');
         end
      else  
         AI_GalvoX_PeakPos = find(diff(sign(diff(AI_GalvoX_Mean))))+1;
         AI_GalvoX_Diff2 = diff(AI_GalvoX_Mean, 2);
         if AI_GalvoX_Diff2(AI_GalvoX_PeakPos-1)> 0   %%% Local minimum
            handles.Galvo.AcqDelayTime = handles.Galvo.AcqDelayTime + (AI_GalvoX_PeakPos - 1)*handles.Daq.PixelDwellTime;
         else                                         %%% Local maximum
            handles.Galvo.AcqDelayTime = handles.Galvo.AcqDelayTime - (handles.Galvo.PixelX - AI_GalvoX_PeakPos)*handles.Daq.PixelDwellTime;
         end
      end 
   end
   %%% Trial with updated handles.Galvo.AcqDelayTime
   AI_InitDelayTime = handles.Galvo.GalvoFlybackTime + handles.Galvo.AcqDelayTime;  
   %%%  Configure tasks
   %%%  AO task for Galvo
   SequenceSize = 2*size(handles.Galvo.WaveformX,1);
   GalvoWaveform = int16(zeros(SequenceSize,1));
   for i = 1:2:SequenceSize-1
       GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
       GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
   end
   DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1));
   DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
   DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);
   DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Seconds);
   DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTime);
   DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1), 0, GalvoWaveform);       
   %%%  AO task for Eom Static Output
   DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
   DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
   DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
   DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
   DAQStopTask(handles.Eom.AO_Handle);
   %%%  AI task
   AI_ScalingCoeff = []; 
   AI_AcqChannel = [5 6 7];
   AI_ReadChannel = ' ';
   for i = 1: length(AI_AcqChannel)
       ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
       if i ~= length(AI_AcqChannel)
          AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
       else
          AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
       end
       DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
       DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
       AI_ScalingCoeff = [AI_ScalingCoeff; DAQGetAIDevScalingCoeff(handles.Daq.AI_Handle, ActiveChannel)];
   end
   DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);
   AI_SamplePerChan = round((handles.Galvo.FrameLength-handles.Galvo.FrameRetraceLength)/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
   AI_SampleAllChan = AI_SamplePerChan*length(AI_AcqChannel);
   AI_Data = int16(zeros(AI_SampleAllChan, 1));
   DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SamplePerChan);
   DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_DigEdge);
   DAQCfgDigEdgeStartTrig(handles.Daq.AI_Handle,'/PXI1Slot3/ao/StartTrigger',DAQmx_Val_Rising);
   DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
   DAQSetStartTrigDelayUnits(handles.Daq.AI_Handle, DAQmx_Val_Seconds);
   DAQSetStartTrigDelay(handles.Daq.AI_Handle, AI_InitDelayTime);
   %%%  Start tasks (all shutters off)    
   DAQStartTask(handles.Daq.AI_Handle);
   DAQStartTask(handles.Galvo.AO_Handle);
   % AcqWaitbar = waitbar(0,'Recording Galvo and Objective position w/ final delay time !','Name','Data acquisition progress');
   waitbar(1,AcqWaitbar, 'Delay time tuning done !');
   pause(0.5);
   waitbar(0,AcqWaitbar, 'Recording XYZ positions w/ tuned delay time !');
   DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
   %%% Wait until done and read data
   for i = 1: 3
       pause(handles.Galvo.FrameLength/handles.Galvo.AO_UpdateRate/3);
       waitbar(i/3, AcqWaitbar,'Recording XYZ positions w/ tuned delay time !'); 
   end
   close(AcqWaitbar);
   DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
   AI_Data = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SamplePerChan, AI_Data);
   %%% stop tasks
   DAQStopTask(handles.Galvo.AO_Handle);  
   DAQStopTask(handles.Daq.AI_Handle);
   %%% Reset start trigger
   DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
   %%% Process, display and save data 
   %%%% Retrieve data
   AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)));
   AI_ImageRepLength = round(AI_SamplePerChan/handles.Daq.DaqRepeat);
   AI_ImageLineLength = round(AI_SamplePerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
   AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
   AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
   AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
   for i = 1: length(AI_AcqChannel)
       AI_DataTemp = AI_Data(i:length(AI_AcqChannel):end);
       for j = 1: handles.Galvo.PixelY
           for k = 1: handles.Galvo.PixelX
               AI_DataTemp2 = 0;
               for p = 1: handles.Daq.DaqRepeat
                   AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                             +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
               end    
               AI_SaveData(j, k, i) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
           end
        end
        AI_Volt(:,:,i) = AI_ScalingCoeff(i,1)+AI_ScalingCoeff(i,2)*double(AI_SaveData(:,:,i))+AI_ScalingCoeff(i,3)*double(AI_SaveData(:,:,i).^2)+AI_ScalingCoeff(i,4)*double(AI_SaveData(:,:,i).^3);
        AI_SaveData(:,:,i) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_Volt(:,:,i)/2/handles.Daq.AI_Range(AI_AcqChannel(i)+1)*2^16);
   end         
   %%% Display and save data
   AI_GalvoX = AI_SaveData(:,:,1);
   AI_GalvoX_Mean = mean(AI_GalvoX, 1);
   handles.Daq.AI_SurveyScanImg = AI_SaveData;
   handles.Daq.SurveyImgActiveType = 0;
   DispAcqData(hObject, eventdata, handles, AI_SaveData);
   set(handles.edit_AcqDelayTime,'string',num2str(handles.Galvo.AcqDelayTime*1e6));
   set(handles.pushbutton_TuneAcqDelay,'BackgroundColor',[0.94 0.94 0.94]); 
   DispSystStatus(handles, 'Acq Delay Time Tuning Done !');
elseif any(handles.Daq.DaqMode == [2 3 4 5])
 
else
   set(handles.pushbutton_TuneAcqDelay,'BackgroundColor',[0.94 0.94 0.94]); 
end
%%% Save handles
guidata(hObject, handles);

%%% Set GalvoAO_Update
function edit_GalvoAO_UpdateRate_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   val = round(str2double(get(handles.edit_GalvoAO_UpdateRate, 'string')));
   switch val
      case 5e5
           handles.Galvo.AO_UpdateRate = val;
      case 8e5
           handles.Galvo.AO_UpdateRate = val; 
      otherwise
           if abs(val - 5e5) < abs(val - 8e5)
              handles.Galvo.AO_UpdateRate = 5e5; 
           else
              handles.Galvo.AO_UpdateRate = 8e5;
           end
   end
   if handles.Galvo.AO_UpdateRate == 5e5
      if handles.Daq.AI_SampleRate == 1e6
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      elseif handles.Daq.AI_SampleRate == 1.25e6
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/5)*5,5);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      else
         handles.Daq.AI_SampleRate == 1e6;
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      end
   else
      handles.Daq.AI_SampleRate = 1e6; 
      handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/5)*5,5);
      handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
   end
   handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
   handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
   %%% Set Display
   set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
   set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
   set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
   set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
elseif any(handles.Daq.DaqMode == [2 3])
   handles.Galvo.AO_UpdateRate = 5e4;
   set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
else
    
end 
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo SettleTime
function edit_GalvoSettleTime_Callback(hObject, eventdata, handles)
val = str2double(get(hObject, 'string'));
handles.Galvo.GalvoSettleTime = min(val/1e6,handles.Galvo.GalvoFlybackTime);
set(hObject, 'string',num2str(handles.Galvo.GalvoSettleTime*1e6));
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set Galvo FlybackTime
function edit_GalvoFlybackTime_Callback(hObject, eventdata, handles)
val = str2double(get(hObject, 'string'));
handles.Galvo.GalvoFlybackTime = val/1e6;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set FillFraction
function edit_FillFraction_Callback(hObject, eventdata, handles)
val = str2double(get(hObject, 'string'));
if val<=100
   handles.Galvo.FillFraction = double(val)/100;
else
   handles.Galvo.FillFraction = 0.8;
end   
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set PhotonCntrRes
function edit_PhotonCntrRes_Callback(hObject, eventdata, handles)
if ~isnan(str2double(get(handles.edit_PhotonCntrRes,'string')))
   val = str2double(get(handles.edit_PhotonCntrRes,'string'));
   val = max(val, 1);
   if mod(handles.Eom.ExcPeriod*1e6, val)==0
      handles.Daq.PhotonCntrRes = val/1e6;
   else
      ExcPeriodDivisor = divisors(handles.Eom.ExcPeriod*1e6); 
      DivisorInd = find(abs(ExcPeriodDivisor-val)==min(abs(ExcPeriodDivisor-val)),1,'first');
      handles.Daq.PhotonCntrRes = ExcPeriodDivisor(DivisorInd)/1e6;
   end
   set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6)); 
else
   set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6)); 
end
%%% Save handles
guidata(hObject, handles);

%%% Set FZ SettleTime
function edit_FZ_SettleTime_Callback(hObject, eventdata, handles)
handles.Stages.StageFZ_SettleTime = str2double(get(handles.edit_FZ_SettleTime,'string'))/1e6;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set FZ FlybackTime
function edit_FZ_FlybackTime_Callback(hObject, eventdata, handles)
handles.Stages.StageFZ_FlybackTime = str2double(get(handles.edit_FZ_FlybackTime,'string'))/1e6;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set FZ AcqDelayTime 
function edit_FZ_AcqDelayTime_Callback(hObject, eventdata, handles)
handles.Stages.StageFZ_AcqDelayTime = str2double(get(handles.edit_FZ_AcqDelayTime,'string'))/1e6;
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Shutters
%%% Silence ShutterMain to avoid the noise when openning it  
function pushbutton_SilenceShutterMain_Callback(hObject, eventdata, handles)
if handles.Daq.Shutter0_SilenceStatus
   handles.Daq.Shutter0_SilenceStatus = 0;
   set(handles.pushbutton_SilenceShutterMain,'BackgroundColor',[0.94 0.94 0.94]);
   handles.Daq.Shutter0_Close();
else
   handles.Daq.Shutter0_SilenceStatus = 1; 
   set(handles.pushbutton_SilenceShutterMain,'BackgroundColor',[1 0 0]);
   handles.Daq.Shutter0_Open();
end
ShutterStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Control ShutterMain
function pushbutton_ShutterMain_Callback(hObject, eventdata, handles)
if handles.Daq.Shutter0_SilenceStatus
else
   if handles.Daq.ShutterStatus(1)==0
      handles.Daq.Shutter0_Open();
   else
      handles.Daq.Shutter0_Close();
   end
   ShutterStatusDisp(hObject, eventdata, handles);
   %%% Save handles
   guidata(hObject, handles);
end

%%% Control ShutterCh12
function pushbutton_ShutterCh12_Callback(hObject, eventdata, handles)
if handles.Daq.ShutterStatus(2)==0
    handles.Daq.Shutter1_Open();
else
    handles.Daq.Shutter1_Close();
end
ShutterStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Control ShutterCh34
function pushbutton_ShutterCh34_Callback(hObject, eventdata, handles)
if handles.Daq.ShutterStatus(3)==0
    handles.Daq.Shutter2_Open();
else
    handles.Daq.Shutter2_Close();
end
ShutterStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Data saving parameters
%%% Set data SavePath via edit
function edit_SavePath_Callback(hObject, eventdata, handles)
if exist(get(handles.edit_SavePath,'string'), 'dir')==7
   handles.Daq.SavePath = get(handles.edit_SavePath,'string');
else
   set(handles.edit_SavePath,'string',handles.Daq.SavePath);     
end
%%% Save handles
guidata(hObject, handles);

%%% Set data SavePath
function pushbutton_SetSavePath_Callback(hObject, eventdata, handles)
str = uigetdir('E:\Data\','Please select path to save your data!');
listing = dir(str);
SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')];
if isempty(find(ismember({listing.name},SaveFolder)))
   mkdir(str,SaveFolder);
else
end
handles.Daq.SavePath = [str,'\',SaveFolder,'\'];
set(handles.edit_SavePath,'string', handles.Daq.SavePath);
%%% Save handles
guidata(hObject, handles);

%%% Set data SaveFilename
function edit_SaveFilename_Callback(hObject, eventdata, handles)
str = get(handles.edit_SaveFilename,'string'); 
if strcmp(str,' ') | isempty(str)  
   handles.Daq.SaveFilename = handles.Daq.SaveFilenameList{handles.Daq.DaqMode+1};
   set(handles.edit_SaveFilename,'string',handles.Daq.SaveFilename);
else
   str(find(str=='.'):end)=[];
   handles.Daq.SaveFilename = str;
   set(handles.edit_SaveFilename,'string',str);
end
%%% Save handles
guidata(hObject, handles);

%%% Set data SaveStatus
function radiobutton_SaveStatus_Callback(hObject, eventdata, handles)
handles.Daq.SaveStatus = get(handles.radiobutton_SaveStatus,'Value');
%%% Save handles
guidata(hObject, handles);

%%% Set data DisplayStatus
function radiobutton_DisplayStatus_Callback(hObject, eventdata, handles)
handles.Daq.DisplayStatus = get(handles.radiobutton_DisplayStatus,'Value');
%%% Save handles
guidata(hObject, handles);

%%% Configure DaqStatus
function uibuttongroup_DaqStatus_SelectionChangedFcn(hObject, eventdata, handles)
val = get(handles.radiobutton_Acquisition, 'value');
handles.Daq.DaqStatus = val;
DaqModeConfig(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set ActiveCh1
function radiobutton_ActiveCh1_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])   %%%% TD PMT not used
   handles.Daq.CI_ActiveStatus = 0;
   set(handles.radiobutton_ActiveCh1,'value',0);
else 
   handles.Daq.CI_ActiveStatus = 1;
   set(handles.radiobutton_ActiveCh1,'value',1);
end
%%% Save handles
guidata(hObject, handles);

%%% Set ActiveCh2
function radiobutton_ActiveCh2_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(2+1) = get(handles.radiobutton_ActiveCh2,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(2+1) = 1;
      set(handles.radiobutton_ActiveCh2,'value',1);
   end
else 
   handles.Daq.AI_ActiveChannel(2+1) = 0;
   set(handles.radiobutton_ActiveCh2,'value',0);
end
%%% Save handles
guidata(hObject, handles);

%%% Set ActiveC3
function radiobutton_ActiveCh3_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(3+1) = get(handles.radiobutton_ActiveCh3,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(3+1) = 1;
      set(handles.radiobutton_ActiveCh3,'value',1);
   end
else 
   handles.Daq.AI_ActiveChannel(3+1) = 0;
   set(handles.radiobutton_ActiveCh3,'value',0);
end
%%% Save handles
guidata(hObject, handles);

%%% Set ActiveCh4
function radiobutton_ActiveCh4_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(4+1) = get(handles.radiobutton_ActiveCh4,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(4+1) = 1;
      set(handles.radiobutton_ActiveCh4,'value',1);
   end
else 
   handles.Daq.AI_ActiveChannel(4+1) = 0;
   set(handles.radiobutton_ActiveCh4,'value',0);
end
%%% Save handles
guidata(hObject, handles);

%%% Record X Pos
function radiobutton_ActivePosX_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])  
   handles.Daq.AI_ActiveChannel(5+1) = get(handles.radiobutton_ActivePosX,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(5+1) = 1;
   end
else 
   handles.Daq.AI_ActiveChannel(5+1) = get(handles.radiobutton_ActivePosX,'value');
end
set(handles.radiobutton_ActivePosX,'value',handles.Daq.AI_ActiveChannel(5+1));
%%% Save handles
guidata(hObject, handles);

%%% Record Y Pos
function radiobutton_ActivePosY_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   handles.Daq.AI_ActiveChannel(7+1) = get(handles.radiobutton_ActivePosY,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(7+1) = 1;
   end
else 
   handles.Daq.AI_ActiveChannel(7+1) = get(handles.radiobutton_ActivePosY,'value');
end
set(handles.radiobutton_ActivePosY,'value',handles.Daq.AI_ActiveChannel(7+1));
%%% Save handles
guidata(hObject, handles);

%%% Record FZ Pos
function radiobutton_ActivePosFZ_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(6+1) = get(handles.radiobutton_ActivePosFZ,'value');
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(6+1) = 1;
   end
else 
   handles.Daq.AI_ActiveChannel(6+1) = get(handles.radiobutton_ActivePosFZ,'value');
end
set(handles.radiobutton_ActivePosFZ,'value',handles.Daq.AI_ActiveChannel(6+1));
%%% Save handles
guidata(hObject, handles);

%%% Read accelerometer data
function radiobutton_Accelerometer_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(1+1) = get(handles.radiobutton_Accelerometer,'value'); 
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(1+1) = 1;
   end
else
   handles.Daq.AI_ActiveChannel(1+1) = get(handles.radiobutton_Accelerometer,'value'); 
end
set(handles.radiobutton_Accelerometer,'value',handles.Daq.AI_ActiveChannel(1+1));   
%%% Save handles
guidata(hObject, handles);

%%% Record laser power during daq
function radiobutton_LaserPower_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   handles.Daq.AI_ActiveChannel(0+1) = get(handles.radiobutton_LaserPower,'value'); 
   if ~any(handles.Daq.AI_ActiveChannel)
      handles.Daq.AI_ActiveChannel(0+1) = 1;
   end
else
   handles.Daq.AI_ActiveChannel(0+1) = get(handles.radiobutton_LaserPower,'value'); 
end
set(handles.radiobutton_LaserPower,'value',handles.Daq.AI_ActiveChannel(0+1));   
%%% Save handles
guidata(hObject, handles);

%%% Set AI_RangeCh2
function popupmenu_AI_RangeCh2_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu_AI_RangeCh2,'Value');
handles.Daq.AI_Range(2+1) = handles.Daq.AI_RangeList(val); 
DAQSetAIMin(handles.Daq.AI_Handle, 'PXI1Slot2/ai2', -handles.Daq.AI_Range(2+1));
DAQSetAIMax(handles.Daq.AI_Handle, 'PXI1Slot2/ai2', handles.Daq.AI_Range(2+1));
handles.Daq.AI_ScalingCoeff(2+1,:) = DAQGetAIDevScalingCoeff(handles.Daq.AI_Handle, 'PXI1Slot2/ai2');
%%% Save handles
guidata(hObject, handles);

%%% Set AI_RangeCh3
function popupmenu_AI_RangeCh3_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu_AI_RangeCh3,'Value');
handles.Daq.AI_Range(3+1) = handles.Daq.AI_RangeList(val);  
DAQSetAIMin(handles.Daq.AI_Handle, 'PXI1Slot2/ai3', -handles.Daq.AI_Range(3+1));
DAQSetAIMax(handles.Daq.AI_Handle, 'PXI1Slot2/ai3', handles.Daq.AI_Range(3+1));
handles.Daq.AI_ScalingCoeff(3+1,:) = DAQGetAIDevScalingCoeff(handles.Daq.AI_Handle, 'PXI1Slot2/ai3');
%%% Save handles
guidata(hObject, handles);

%%% Set AI_RangeCh4
function popupmenu_AI_RangeCh4_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu_AI_RangeCh4,'Value');
handles.Daq.AI_Range(4+1) = handles.Daq.AI_RangeList(val);  
DAQSetAIMin(handles.Daq.AI_Handle, 'PXI1Slot2/ai4', -handles.Daq.AI_Range(4+1));
DAQSetAIMax(handles.Daq.AI_Handle, 'PXI1Slot2/ai4', handles.Daq.AI_Range(4+1));
handles.Daq.AI_ScalingCoeff(4+1,:) = DAQGetAIDevScalingCoeff(handles.Daq.AI_Handle, 'PXI1Slot2/ai4');
%%% Save handles
guidata(hObject, handles);

%%% Set InvertCh2
function radiobutton_InvertCh2_Callback(hObject, eventdata, handles)
handles.Daq.AI_InverseChannel(2+1) = get(handles.radiobutton_InvertCh2,'Value');
%%% Save handles
guidata(hObject, handles);

%%% Set InvertCh3
function radiobutton_InvertCh3_Callback(hObject, eventdata, handles)
handles.Daq.AI_InverseChannel(3+1) = get(handles.radiobutton_InvertCh3,'Value');
%%% Save handles
guidata(hObject, handles);

%%% Set InvertCh4
function radiobutton_InvertCh4_Callback(hObject, eventdata, handles)
handles.Daq.AI_InverseChannel(4+1) = get(handles.radiobutton_InvertCh4,'Value');
%%% Save handles
guidata(hObject, handles);

%%% Set StackStart
function edit_StackStart_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_StackStart,'string'));
if val < 0 
    val = 0;
elseif val > 450
   val = 450;
else
end
handles.Daq.StackInfo(1) = val;
if handles.Daq.DaqMode == 1
   if (handles.Daq.StackInfo(2) - handles.Daq.StackInfo(1)) < handles.Daq.StackInfo(3)
      handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1);
      handles.Daq.FrameNum = 1;
   else
      handles.Daq.FrameNum = floor((handles.Daq.StackInfo(2) - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3))+1;
      handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + (handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3);
   end
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
else
   handles.Daq.FrameNum = 1;
   handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1);  
end
set(handles.edit_StackStart,'string',num2str(handles.Daq.StackInfo(1)));
set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
handles.Stages.MoveStageFZ(handles.Daq.StackInfo(1));
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4))); 
%%% Save handles
guidata(hObject, handles);

%%% Set StackEnd
function edit_StackEnd_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_StackEnd,'string'));
if val < 0 
    val = 0;
elseif val > 450
   val = 450;
else
end
handles.Daq.StackInfo(2) = val;
if handles.Daq.DaqMode == 1
   if (handles.Daq.StackInfo(2) - handles.Daq.StackInfo(1)) < handles.Daq.StackInfo(3)
      handles.Daq.StackInfo(1) = handles.Daq.StackInfo(2);
      handles.Daq.FrameNum = 1;
   else
      handles.Daq.FrameNum = floor((handles.Daq.StackInfo(2) - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3))+1;
      handles.Daq.StackInfo(1) = handles.Daq.StackInfo(2) - (handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3);
   end
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
else
   handles.Daq.FrameNum = 1;
   handles.Daq.StackInfo(1) = handles.Daq.StackInfo(2);  
end
set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
set(handles.edit_StackStart,'string',num2str(handles.Daq.StackInfo(1)));
set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
handles.Stages.MoveStageFZ(handles.Daq.StackInfo(1));
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4))); 
%%% Save handles
guidata(hObject, handles);

%%% Set FrameNum
function edit_FrameNum_Callback(hObject, eventdata, handles)
if handles.Daq.DaqMode == 1
   handles.Daq.FrameNum = max(str2double(get(handles.edit_FrameNum,'string')),1);
   handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + (handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3);
   if handles.Daq.StackInfo(2) > 450
      handles.Daq.FrameNum = floor((450 - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3)) + 1;
      handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + (handles.Daq.FrameNum - 1)*handles.Daq.StackInfo(3);
      set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
   else
   end
   set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
else
   handles.Daq.FrameNum = 1;
   handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1);
   set(handles.edit_FrameNum,'string', handles.Daq.FrameNum);
   set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
end
%%% Save handles
guidata(hObject, handles);

%%% Set StackStep
function edit_StackStep_Callback(hObject, eventdata, handles)
handles.Daq.StackInfo(3) = str2double(get(handles.edit_StackStep,'string'));
handles.Daq.StackInfo(3) = min(handles.Daq.StackInfo(3), 400);
set(handles.edit_StackStep,'string',num2str(handles.Daq.StackInfo(3)));
if handles.Daq.DaqMode == 1
   handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) +(handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3);
   if handles.Daq.StackInfo(2) > 450
      handles.Daq.FrameNum = floor((450 - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3)) + 1;
      handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + (handles.Daq.FrameNum - 1)*handles.Daq.StackInfo(3);
      set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
   else
   end
   set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
else
    
end
%%% Save handles
guidata(hObject, handles);

%%% Set DaqRepeat
function edit_DaqRepeat_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1]) 
   val = max(1,round(str2double(get(handles.edit_DaqRepeat,'string')))); 
   handles.Daq.DaqRepeat = val;
   set(handles.edit_DaqRepeat,'string',num2str(val));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
elseif any(handles.Daq.DaqMode == [3 5]) 
   val = max(1,round(str2double(get(handles.edit_DaqRepeat,'string')))); 
   handles.Daq.DaqRepeat = val;
   set(handles.edit_DaqRepeat,'string',num2str(val));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
else
   handles.Daq.DaqRepeat = 1;
   set(handles.edit_DaqRepeat,'string',num2str(handles.Daq.DaqRepeat));
end
%%% Save handles
guidata(hObject, handles);

%%% Set AcqDelayTime
function edit_AcqDelayTime_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_AcqDelayTime,'string'));
if any(handles.Daq.DaqMode == [2 3])
   val = min(val, 20);
   set(handles.edit_AcqDelayTime,'string', num2str(val));
else
end
handles.Galvo.AcqDelayTime = val/1e6;
set(handles.edit_AcqDelayTime,'string',num2str(handles.Galvo.AcqDelayTime*1e6));
handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set FZ_Return
function radiobutton_FZ_Return_Callback(hObject, eventdata, handles)
handles.Stages.StageFZ_ReturnFlag = get(handles.radiobutton_FZ_Return,'value');
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Square FOV Setting
function radiobutton_SquFOV_Callback(hObject, eventdata, handles)
handles.Galvo.SquFOV_Status = get(handles.radiobutton_SquFOV,'value');
if handles.Galvo.SquFOV_Status & handles.Galvo.VoltRangeY~=handles.Galvo.VoltRangeX & handles.Galvo.PixelY~=handles.Galvo.PixelX
   handles.Galvo.VoltRangeY = handles.Galvo.VoltRangeX;
   handles.Galvo.PixelY = handles.Galvo.PixelX;
   set(handles.edit_VoltRangeY,'string',num2str(handles.Galvo.VoltRangeY));
   set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles); 
end
%%% Save handles
guidata(hObject, handles);

%%% Set AI_SampleRate
function edit_AI_SampleRate_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   val = round(str2double(get(handles.edit_AI_SampleRate,'string')));
   switch val
       case 1e6
            handles.Daq.AI_SampleRate = val;
       case 1.25e6
            handles.Daq.AI_SampleRate = val; 
       otherwise
           if abs(val - 1e6) < abs(val - 1.25e6)
              handles.Daq.AI_SampleRate = 1e6; 
           else
              handles.Daq.AI_SampleRate = 1.25e6; 
           end
   end
   if handles.Daq.AI_SampleRate == 1e6
      if handles.Galvo.AO_UpdateRate == 5e5
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      elseif handles.Galvo.AO_UpdateRate == 8e5
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/5)*5,5);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      else
         handles.Galvo.AO_UpdateRate = 5e5;
         handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
         handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
      end
   else
      handles.Galvo.AO_UpdateRate = 5e5;
      handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/5)*5,5);
      handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
   end
   handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
   handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
   %%% Set Display
   set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
   set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
   set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
   set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
elseif handles.Daq.DaqMode == 2 
   %%% handles.Daq.AI_SampleRate = 8e3;
   handles.Daq.AI_SampleRate = 4e4;
   set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
elseif handles.Daq.DaqMode == 3
   val = round(str2double(get(handles.edit_AI_SampleRate,'string')));
   switch val
       case 1e6
            handles.Daq.AI_SampleRate = val;
       otherwise
            handles.Daq.AI_SampleRate = 1e3;
   end
   set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
else
   handles.Daq.AI_SampleRate = 1e3;
   set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));   
end
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set SamplePerPx
function edit_SamplePerPx_Callback(hObject, eventdata, handles)
val = round(str2double(get(handles.edit_SamplePerPx,'string')));
if any(handles.Daq.DaqMode == [0 1])
   switch handles.Daq.AI_SampleRate
       case 1e6
          if handles.Galvo.AO_UpdateRate == 5e5
             handles.Daq.SamplePerPx = max(ceil(val/2)*2,2);
             handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
          else
             handles.Daq.SamplePerPx = max(ceil(val/5)*5,5);
             handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
          end
       case 1.25e6
          handles.Daq.SamplePerPx = max(ceil(val/5)*5,5); 
          handles.Eom.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
   end 
else
   set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));  
end 
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;
%%% Set Display
set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
%%% Configure DaqMode
DaqModeConfig(hObject, eventdata, handles); 
%%% Save handles
guidata(hObject, handles);

%%% Set WaveformDisplaySelect
function uibuttongroup_WaveformDisplaySelect_SelectionChangedFcn(hObject, eventdata, handles)
handles.Galvo.WavDisplayMode = ~get(handles.radiobutton_GalvoWavDisplay,'value');
if handles.Galvo.WavDisplayMode
   handles.Stages.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
else
   handles.Galvo.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);   
end
%%% Save handles
guidata(hObject, handles);

%%% Set Ch1ColorbarMax
function edit_Ch1ColorbarMax_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch1ColorbarMax,'string'));
if val > handles.Daq.AxesColorbarMin(1) & handles.Daq.SurveyImgActiveType == 0 & ~isempty(handles.Daq.AI_SurveyScanImg)  
   handles.Daq.AxesColorbarMax(1) = val;
   axes(handles.axes_Ch1);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,1)), [handles.Daq.AxesColorbarMin(1) handles.Daq.AxesColorbarMax(1)]);
   set(h,'uicontextmenu', handles.ContextmenuCh1);
   colormap(handles.axes_Ch1,handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
   colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
   set(handles.axes_Ch1,'FontSize', 8, 'OuterPosition',[0.45 0.45 0.28 0.54],'Position',[0.47 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch1');
elseif val > handles.Daq.AxesColorbarMin(1) & handles.Daq.SurveyImgActiveType == 1 & ~isempty(handles.Daq.SurveyScanImg) 
   handles.Daq.AxesColorbarMax(1) = val;
   axes(handles.axes_Ch1);
   h = imagesc(fliplr(handles.Daq.SurveyScanImg), [handles.Daq.AxesColorbarMin(1) handles.Daq.AxesColorbarMax(1)]);
   set(h,'uicontextmenu', handles.ContextmenuCh1);
   colormap(handles.axes_Ch1,handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
   colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
   set(handles.axes_Ch1,'FontSize', 8, 'OuterPosition',[0.45 0.45 0.28 0.54],'Position',[0.47 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch1');
else  
end
set(handles.edit_Ch1ColorbarMax,'string',num2str(handles.Daq.AxesColorbarMax(1)));
%%% Save handles
guidata(hObject, handles);

%%% Set Ch1ColorbarMin
function edit_Ch1ColorbarMin_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch1ColorbarMin,'string'));
if val < handles.Daq.AxesColorbarMax(1) & handles.Daq.SurveyImgActiveType == 0 & ~isempty(handles.Daq.AI_SurveyScanImg)
   handles.Daq.AxesColorbarMin(1) = val;
   axes(handles.axes_Ch1);
   h = imagesc(fliplr(handles.Daq.SurveyScanImg(:,:,1)), [handles.Daq.AxesColorbarMin(1) handles.Daq.AxesColorbarMax(1)]);
   set(h,'uicontextmenu', handles.ContextmenuCh1);
   colormap(handles.axes_Ch1, handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
   colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
   set(handles.axes_Ch1,'FontSize', 8, 'OuterPosition',[0.45 0.45 0.28 0.54],'Position',[0.47 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch1');
elseif val < handles.Daq.AxesColorbarMax(1) & handles.Daq.SurveyImgActiveType == 1 & ~isempty(handles.Daq.SurveyScanImg)
   handles.Daq.AxesColorbarMin(1) = val;
   axes(handles.axes_Ch1);
   h = imagesc(fliplr(handles.Daq.SurveyScanImg), [handles.Daq.AxesColorbarMin(1) handles.Daq.AxesColorbarMax(1)]);
   set(h,'uicontextmenu', handles.ContextmenuCh1);
   colormap(handles.axes_Ch1, handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
   colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
   set(handles.axes_Ch1,'FontSize', 8, 'OuterPosition',[0.45 0.45 0.28 0.54],'Position',[0.47 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch1');
else    
end
set(handles.edit_Ch1ColorbarMin,'string',num2str(handles.Daq.AxesColorbarMin(1))); 
%%% Save handles
guidata(hObject, handles);

%%% Set Ch2ColorbarMax
function edit_Ch2ColorbarMax_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch2ColorbarMax,'string'));
if val > handles.Daq.AxesColorbarMin(2) & size(handles.Daq.AI_SurveyScanImg,3)>= 2
   handles.Daq.AxesColorbarMax(2) = val;
   axes(handles.axes_Ch2);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,2)), [handles.Daq.AxesColorbarMin(2) handles.Daq.AxesColorbarMax(2)]);
   set(h,'uicontextmenu', handles.ContextmenuCh2);
   colormap(handles.axes_Ch2, handles.Daq.ColormapRange{handles.Daq.AxesColormap(2)});
   colorbar(handles.axes_Ch2, 'Position', [0.97 0.53 0.01 0.44]);
   set(handles.axes_Ch2,'FontSize', 8, 'OuterPosition',[0.725 0.45 0.28 0.54],'Position',[0.745 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch2');
else
end
set(handles.edit_Ch2ColorbarMax,'string',num2str(handles.Daq.AxesColorbarMax(2)));    
%%% Save handles
guidata(hObject, handles);

%%% Set Ch2ColorbarMin
function edit_Ch2ColorbarMin_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch2ColorbarMin,'string'));
if val < handles.Daq.AxesColorbarMax(2) & size(handles.Daq.AI_SurveyScanImg,3)>= 2
   handles.Daq.AxesColorbarMin(2) = val;
   axes(handles.axes_Ch2);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,2)), [handles.Daq.AxesColorbarMin(2) handles.Daq.AxesColorbarMax(2)]);
   set(h,'uicontextmenu', handles.ContextmenuCh2);
   colormap(handles.axes_Ch2, handles.Daq.ColormapRange{handles.Daq.AxesColormap(2)});
   colorbar(handles.axes_Ch2, 'Position', [0.97 0.53 0.01 0.44]);
   set(handles.axes_Ch2,'FontSize', 8, 'OuterPosition',[0.725 0.45 0.28 0.54],'Position',[0.745 0.53 0.22 0.44]);
   set(h,'Tag','axes_Ch2');
else 
end
set(handles.edit_Ch2ColorbarMin,'string',num2str(handles.Daq.AxesColorbarMin(2)));    
%%% Save handles
guidata(hObject, handles);

%%% Set Ch3ColorbarMax
function edit_Ch3ColorbarMax_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch3ColorbarMax,'string'));
if val > handles.Daq.AxesColorbarMin(3) & size(handles.Daq.AI_SurveyScanImg,3)>= 3
   handles.Daq.AxesColorbarMax(3) = val;
   axes(handles.axes_Ch3);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,3)), [handles.Daq.AxesColorbarMin(3) handles.Daq.AxesColorbarMax(3)]);
   set(h,'uicontextmenu', handles.ContextmenuCh3);
   colormap(handles.axes_Ch3, handles.Daq.ColormapRange{handles.Daq.AxesColormap(3)});
   colorbar(handles.axes_Ch3, 'Position', [0.695 0.037 0.01 0.44]);
   set(handles.axes_Ch3,'FontSize', 8, 'OuterPosition',[0.45 -0.023 0.28 0.54],'Position',[0.47 0.037 0.22 0.44]);
   set(h,'Tag','axes_Ch3');
else
end
set(handles.edit_Ch3ColorbarMax,'string',num2str(handles.Daq.AxesColorbarMax(3)));    
%%% Save handles
guidata(hObject, handles);

%%% Set Ch3ColorbarMin
function edit_Ch3ColorbarMin_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch3ColorbarMin,'string'));
if val < handles.Daq.AxesColorbarMax(3) & size(handles.Daq.AI_SurveyScanImg,3)>= 3
   handles.Daq.AxesColorbarMin(3) = val;
   axes(handles.axes_Ch3);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,3)), [handles.Daq.AxesColorbarMin(3) handles.Daq.AxesColorbarMax(3)]);
   set(h,'uicontextmenu', handles.ContextmenuCh3);
   colormap(handles.axes_Ch3, handles.Daq.ColormapRange{handles.Daq.AxesColormap(3)});
   colorbar(handles.axes_Ch3, 'Position', [0.695 0.037 0.01 0.44]);
   set(handles.axes_Ch3,'FontSize', 8, 'OuterPosition',[0.45 -0.023 0.28 0.54],'Position',[0.47 0.037 0.22 0.44]);
   set(h,'Tag','axes_Ch3');
else
end
set(handles.edit_Ch3ColorbarMin,'string',num2str(handles.Daq.AxesColorbarMin(3)));    
%%% Save handles
guidata(hObject, handles);

%%% Set Ch4ColorbarMax
function edit_Ch4ColorbarMax_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch4ColorbarMax,'string'));
if val > handles.Daq.AxesColorbarMin(4) & size(handles.Daq.AI_SurveyScanImg,3)>= 4
   handles.Daq.AxesColorbarMax(4) = val;
   axes(handles.axes_Ch4);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,4)), [handles.Daq.AxesColorbarMin(4) handles.Daq.AxesColorbarMax(4)]);
   set(h,'uicontextmenu', handles.ContextmenuCh4);
   colormap(handles.axes_Ch4, handles.Daq.ColormapRange{handles.Daq.AxesColormap(4)});
   colorbar(handles.axes_Ch4, 'Position', [0.97 0.037 0.01 0.44]);
   set(handles.axes_Ch4,'FontSize', 8, 'OuterPosition',[0.725 -0.023 0.28 0.54],'Position',[0.745 0.037 0.22 0.44]);
   set(h,'Tag','axes_Ch4');
else
end
set(handles.edit_Ch4ColorbarMax,'string',num2str(handles.Daq.AxesColorbarMax(4)));    
%%% Save handles
guidata(hObject, handles);

%%% Set Ch4ColorbarMin
function edit_Ch4ColorbarMin_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_Ch4ColorbarMin,'string'));
if val < handles.Daq.AxesColorbarMax(4) & size(handles.Daq.AI_SurveyScanImg,3)>= 4
   handles.Daq.AxesColorbarMin(1) = val;
   axes(handles.axes_Ch4);
   h = imagesc(fliplr(handles.Daq.AI_SurveyScanImg(:,:,4)), [handles.Daq.AxesColorbarMin(4) handles.Daq.AxesColorbarMax(4)]);
   set(h,'uicontextmenu', handles.ContextmenuCh4);
   colormap(handles.axes_Ch4, handles.Daq.ColormapRange{handles.Daq.AxesColormap(4)});
   colorbar(handles.axes_Ch4, 'Position', [0.97 0.037 0.01 0.44]);
   set(handles.axes_Ch4,'FontSize', 8, 'OuterPosition',[0.725 -0.023 0.28 0.54],'Position',[0.745 0.037 0.22 0.44]);
   set(h,'Tag','axes_Ch4');
else  
end
set(handles.edit_Ch4ColorbarMin,'string',num2str(handles.Daq.AxesColorbarMin(4)));    
%%% Save handles
guidata(hObject, handles);

%%% Set colormap of Ch1
function popupmenu_ColormapCh1_Callback(hObject, eventdata, handles)
handles.Daq.AxesColormap(1) = get(handles.popupmenu_ColormapCh1,'value');
colormap(handles.axes_Ch1,handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
%%% Save handles
guidata(hObject, handles);

%%% Set colormap of Ch2
function popupmenu_ColormapCh2_Callback(hObject, eventdata, handles)
handles.Daq.AxesColormap(2) = get(handles.popupmenu_ColormapCh2,'value');
colormap(handles.axes_Ch2,handles.Daq.ColormapRange{handles.Daq.AxesColormap(2)});
colorbar(handles.axes_Ch2, 'Position', [0.97 0.53 0.01 0.44]);
%%% Save handles
guidata(hObject, handles);

%%% Set colormap of Ch3
function popupmenu_ColormapCh3_Callback(hObject, eventdata, handles)
handles.Daq.AxesColormap(3) = get(handles.popupmenu_ColormapCh3,'value');
colormap(handles.axes_Ch3,handles.Daq.ColormapRange{handles.Daq.AxesColormap(3)});
colorbar(handles.axes_Ch3, 'Position', [0.695 0.037 0.01 0.44]);
%%% Save handles
guidata(hObject, handles);

%%% Set colormap of Ch4
function popupmenu_ColormapCh4_Callback(hObject, eventdata, handles)
handles.Daq.AxesColormap(4) = get(handles.popupmenu_ColormapCh4,'value');
colormap(handles.axes_Ch4,handles.Daq.ColormapRange{handles.Daq.AxesColormap(4)});
colorbar(handles.axes_Ch4, 'Position', [0.97 0.037 0.01 0.44]);
%%% Save handles
guidata(hObject, handles);

%%% Accelerometer signal monitor
function pushbutton_TestAcceler_Callback(hObject, eventdata, handles)
if handles.Daq.AccelerMoniStatus == 0
   if handles.Daq.PhotonCntsMoniStatus == 1 
      handles.Daq.PhotonCntsMoniStatus = 0;
      set(handles.radiobutton_PhotonCntsMoni,'value',0);
      set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
      set(handles.text_PhotonCntsMoni,'string',' ');
      if ~isempty(timerfind)
         stop(timerfind);
         delete(timerfind);
      end
      DAQStopTask(handles.Daq.PhotonCntr_Handle);
      DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
   else
      if ~isempty(timerfind)
         stop(timerfind);
         delete(timerfind);
      end
   end
   cla(handles.axes_CriticalDisplay);
   handles.Daq.AccelerMoniStatus = 1;  
   set(handles.pushbutton_TestAcceler, 'BackgroundColor',[1 0 0]);
   %%% Configure AI task for accelerometer monitoring
   DAQSetReadChannelsToRead(handles.Daq.AI_Handle, 'PXI1Slot2/ai1'); 
   AI_SamplePerChan = handles.Daq.AccelerMoniSampNum;
   DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle,' ', handles.Daq.AI_SampleRate, AI_SamplePerChan);
   DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
   DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
   %%% Set timer
   set(handles.radiobutton_AccelerometerMoni,'value',1);
   handles.CriticalDispMode = [0 0 0 0 1];
   set(handles.text_SurveyScanColorbarMin,'Visible','Off');
   set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
   set(handles.text_SurveyScanColorbarMax,'Visible','Off');
   set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
   set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
   
   t_AccelerRead = timer;
   t_AccelerRead.StartDelay = 0;
   t_AccelerRead.TimerFcn = {@AccelerRead, handles};
   t_AccelerRead.ExecutionMode = 'fixedRate';
   t_AccelerRead.Period = 0.2;
   start(t_AccelerRead);
else
   handles.Daq.AccelerMoniStatus = 0; 
   set(handles.radiobutton_AccelerometerMoni,'value',0);
   cla(handles.axes_CriticalDisplay);
   title(handles.axes_CriticalDisplay,' ');
   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   set(handles.text_SurveyScanColorbarMin,'Visible','On');
   set(handles.edit_SurveyScanColorbarMin,'Visible','On');
   set(handles.text_SurveyScanColorbarMax,'Visible','On');
   set(handles.edit_SurveyScanColorbarMax,'Visible','On');
   set(handles.text_PixelInfoCriticalDisp,'Visible','On');

   set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
   if ~isempty(timerfind)
      stop(timerfind);
      delete(timerfind);
   end
   %%% Reset AI settings
   DAQStopTask(handles.Daq.AI_Handle);
end 

%%% Accelerometer Timer callback function
function varargout = AccelerRead(~,~, handles)
DAQStartTask(handles.Daq.AI_Handle);
handles.Daq.AccelerMoniArray = DAQReadAnalogF64(handles.Daq.AI_Handle, handles.Daq.AccelerMoniSampNum, handles.Daq.AccelerMoniArray);
plot(handles.axes_CriticalDisplay,handles.Daq.AccelerMoniArray,'b-');
axis(handles.axes_CriticalDisplay,[1 handles.Daq.AccelerMoniSampNum 1.35 1.75]);
set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
title(handles.axes_CriticalDisplay,'Accelerometer signal monitor');
xlabel(handles.axes_CriticalDisplay,'Data Pts', 'FontSize', 8);
ylabel(handles.axes_CriticalDisplay,'Voltage (volts)','FontSize', 8);
DAQStopTask(handles.Daq.AI_Handle);

%%% Processing pO2 measurement
function pushbutton_pO2Process_Callback(hObject, eventdata, handles)
answer0 = questdlg('Select pO2 data to process ?', 'pO2 data processing option', 'Most recent','Manual selection','Most recent');
switch answer0
    case 'Most recent'   %%% Find the most recent pO2 data and process
       datapath = handles.Daq.SavePath;
       listing = dir(datapath);
       fileindex = find(contains({listing.name},'pO2_Galvo_TD'));
       if ~isempty(fileindex)
          filename = listing(fileindex(end)).name;
          filepath = {[datapath filename]};
          resultfolder = filename(1:end-4);
          resultpath = strcat(datapath, resultfolder, '\');

          resultpath = {resultpath};
          resultfolder = {resultfolder};
          filename = {filename};
       else
          h_msg = msgbox('No pO2 data found in current data folder !'); 
          return;
       end
    case 'Manual selection'    %%% Manually select pO2 data and process
       [filename,datapath] = uigetfile('E:\Data\*.mat','Select pO2 data files','MultiSelect', 'on');
       listing = dir(datapath);
       if iscell(filename)
          indextoskip = find(cellfun('isempty',strfind(filename,'pO2_Galvo_TD')));
          filename(indextoskip) = [];
          if ~isempty(filename)
             filepath = strcat(datapath,filename);
             resultfolder = cellfun(@(S) S(1:end-4), filename, 'UniformOutput', 0);
             resultpath = strcat(datapath,resultfolder,'\');
          else
             h_msg = msgbox('This is not pO2 data !'); 
             return;
          end
       else
          if strfind(filename,'pO2_Galvo_TD')
             filepath = {strcat(datapath,filename)}; 
             resultfolder = filename(1:end-4);
             resultpath = strcat(datapath,resultfolder,'\');
             
             resultpath = {resultpath};
             resultfolder = {resultfolder};
             filename = {filename};
          else
             h_msg = msgbox('This is not pO2 data !'); 
             return;
          end
       end
    otherwise
       return;
end    
if ~isempty(find(contains({listing.name},'Temp.txt')))
   temperature = importdata(strcat(datapath,'Temp.txt'));
else
   prompt = {['Enter temperature during data acquisition (',char(176),'C):']};
   dlgtitle = ['Input temperature (', char(176),'C)'];
   dims = [1 50];
   temp_input = inputdlg(prompt,dlgtitle,dims);
   val = str2double(cell2mat(temp_input));
   if ~isnan(val)
      temperature = val;
   else
      temperature = 36.6;
   end  
end
fitfolderpath = 'E:\PLIM_PO2\fit';
%%% Process and plot pO2 data
for path_index = 1:length(resultpath)
    if exist(resultpath{path_index})== 7
       listing2 = dir(resultpath{path_index});
       resultfilenames = strcat(resultpath{path_index},{listing2.name});
       if (~isempty(find(contains({listing2.name},'dataStruct_delay5_OnlyDecays_pO2.txt'))) |...
          ~isempty(find(contains({listing2.name},'dataStruct_delay5.mat')))) &...
          ~isempty(find(contains({listing2.name},'rel_err.txt')))     
          answer1 = questdlg('The data have been processed, do you want to redo it?', 'Options','Redo','Keep','Keep');
          switch answer1
              case 'Redo'  %%% Redo pO2 processing
                 delete([resultpath{path_index} '*']);
                 FittingStatus = 0;
              case 'Keep'  %%% Plot current processed pO2 data
                 FittingStatus = 1;
          end
       elseif size(resultfilenames,2) > 3 & (isempty(find(contains({listing2.name},'dataStruct_delay5_OnlyDecays_pO2.txt')))|...
          isempty(find(contains({listing2.name},'rel_err.txt'))))
          delete([resultpath{path_index} '*']);
          FittingStatus = 0;
       else   %%% Empty folder
          FittingStatus = 0;
       end
    else
       FittingStatus = 0;
       mkdir(resultpath{path_index}); 
    end
    %%% Data processing
    if FittingStatus == 0
       load(filepath{path_index});
       %%% Preprocesing data
       PixelNumTotal = size(GalvoPara.PO2Pos,1);
       GateNum = floor(EomPara.ExcPeriod/DaqPara.PhotonCntrRes);
       timepts = 0:DaqPara.PhotonCntrRes*1e6:(GateNum-1)*DaqPara.PhotonCntrRes*1e6;
       if DaqPara.DaqRepeat == 1
          PO2Data = double(CI_DataSave);
          %%% PO2DataProcessed = CI_DataProcessed;
       else
          CI_DataSave = double(CI_DataSave);
          DataLengthPixel = EomPara.NumCycles*DaqPara.DaqRepeat;
          DataLengthBase = EomPara.NumCycles*size(GalvoPara.PO2Pos,1);
          PO2Data = zeros(EomPara.NumCycles*size(GalvoPara.PO2Pos,1)*DaqPara.DaqRepeat,size(CI_DataSave,2));
          %%% PO2DataProcessed = zeros(size(GalvoPara.PO2Pos,1),size(CI_DataProcessed,2));
          for iii = 1:DaqPara.DaqRepeat
              %%% PO2DataProcessed = PO2DataProcessed + CI_DataProcessed((iii-1)*size(GalvoPara.PO2Pos,1)+1:iii*size(GalvoPara.PO2Pos,1),:);
              for jjj = 1:size(GalvoPara.PO2Pos,1)
                  PO2Data((jjj-1)*DataLengthPixel+(iii-1)*EomPara.NumCycles+1:(jjj-1)*DataLengthPixel+iii*EomPara.NumCycles,:) = ...
                  CI_DataSave((iii-1)*DataLengthBase+(jjj-1)*EomPara.NumCycles+1:(iii-1)*DataLengthBase+jjj*EomPara.NumCycles,:);    
              end
          end
       end
       PO2Pos = [(1:size(CI_PO2Pos,1))' CI_PO2Pos];
       binned_data = [timepts;PO2Data];
       %%%  Plot surveyscan image 
       survey_image = fliplr(DaqPara.SurveyScanImg);
       survey_image1 = medfilt2(survey_image, [2 2],'symmetric');
       %%% when you are happy with selected/removed points, you get out of loop
       flagDone = 0; 
       flagFirstLoop = 1;
       while ~flagDone
          %%% load image parameters...
          x_pixels = GalvoPara.PixelX;  % # X pixels in frame
          dataStruct.x_pixels = x_pixels;
          y_pixels = GalvoPara.PixelY;  % # Y pixels
          dataStruct.y_pixels = y_pixels;
          excitationDuration_us = EomPara.GateWidth*1e6; % duration of EOM opening (excitation) in us
          dataStruct.excitationDuration_us = excitationDuration_us;
          collectionDuration_us = EomPara.ExcPeriod*1e6;     % duration of total collection time (EOM open + EOM closed) in us
          dataStruct.collectionDuration_us = collectionDuration_us;
          numSinglePointAverages = EomPara.NumCycles*DaqPara.DaqRepeat;            % how many times each pixel was averaged
          dataStruct.numSinglePointAverages = numSinglePointAverages;

          t = binned_data (1,:);
          dataStruct.collectionDurationTimePoints_us = t;
          binned_data = binned_data (2:end,:);
          [numTotReps numTimePtsCollectionDuration] = size(binned_data);
          dataStruct.binned_data = binned_data;
          total_binned_pixels = numTotReps;
          dataStruct.numTotReps = numTotReps;

          bin_interval_us = t(2)-t(1);
          dataStruct.binInterval_us = bin_interval_us;

          selected_points_indices = [(1:size(GalvoPara.PO2Pos,1))' GalvoPara.PO2Pos(:,2) x_pixels+1-GalvoPara.PO2Pos(:,1)];
          dataStruct.selectedPointsEOMtimeIndices = selected_points_indices;
          numImagedPoints = size(selected_points_indices,1);
          dataStruct.numImagedPoints = numImagedPoints;    
      
          %%% load biexponetial fitting parameters for tau to pO2 at 36.6 degree celsius 
          copyfile(fullfile(fitfolderpath, 'MGH_decay.PAR'),resultpath{path_index});
          fitpara = importdata(fullfile(fitfolderpath, 'MGH_decay.PAR'));
          fitpara_lifetime = fitpara.data;
          sy0 = fitpara_lifetime(1);
          sA1 = fitpara_lifetime(2);
          st1 = fitpara_lifetime(3) * 1e6;
          sA2 = fitpara_lifetime(4);
          st2 = fitpara_lifetime(5) * 1e6;
          fitpara_SternVolmer = [1.265776950 14.8 106.1337 18.89122 3.96441e-5 -5.94517e-8];
          p = fitpara_SternVolmer(1);
          a = fitpara_SternVolmer(2)/(10^(6*p));
          kq0 = fitpara_SternVolmer(3);
          beta = fitpara_SternVolmer(4);
          tau0 = fitpara_SternVolmer(5);
          alpha = fitpara_SternVolmer(6);
          % fit function definitions...
          c0 = [1 40 0];
          decay_profile = @(c,xdata) (c(1)*exp(-xdata/c(2))+c(3));
          decay_profile_error = @(c,xdata,ydata) ((ydata - (c(1)*exp(-xdata/c(2))+c(3))) );
          MyOptions = optimoptions(@lsqnonlin,'Display','off','Algorithm','levenberg-marquardt');
          %%% input delay for processing decays after closing EOM 
          delayInterval = 5;
          dataStruct.delayDecayProcessing_us = delayInterval;

          fittedDecayTimePoints_us = 0:bin_interval_us:(collectionDuration_us - excitationDuration_us - mod((collectionDuration_us - excitationDuration_us),bin_interval_us) - bin_interval_us - delayInterval); %make 20 us delay as in Sergei's calibration system
          fittedDecayTimePoints_indices = ceil((excitationDuration_us+delayInterval)/bin_interval_us)+1:1:(collectionDuration_us-bin_interval_us)/bin_interval_us+1;
          dataStruct.fittedDecayTimePoints_us = fittedDecayTimePoints_us;
          dataStruct.fittedDecayTimePoints_indices = fittedDecayTimePoints_indices;  
          %%% reserve memory for processed data (from selected sub decays only)
          mean_lifetime_data       = zeros(numImagedPoints, numTimePtsCollectionDuration);
          summed_lifetime_data     = zeros(numImagedPoints, numTimePtsCollectionDuration);
          normalized_lifetime_data = zeros(numImagedPoints, numTimePtsCollectionDuration);
          stdev_lifetime_data      = zeros(numImagedPoints, numTimePtsCollectionDuration);

          lifetimes   =  zeros(numImagedPoints,3);
          pO2         =  zeros(numImagedPoints,1);
          pO2_SternVolmer = zeros(numImagedPoints,1);
          pO2_std_err =  zeros(numImagedPoints,1);
          pO2_std_err_SternVolmer =  zeros(numImagedPoints,1);
          pO2_rel_err =  zeros(numImagedPoints,1);
          pO2_rel_err_SternVolmer =  zeros(numImagedPoints,1);
          lt_confidence_intervals  = zeros(numImagedPoints, 2);
          lt_std_err  =  zeros(numImagedPoints, 1);

          lt_fit_time =  0:(collectionDuration_us - excitationDuration_us - delayInterval -1);
          lt_fit_profile = zeros(numImagedPoints,length(lt_fit_time));

          %%% reserve memory for all data (from combined selected and excluded sub decays)
          mean_lifetime_data_all       = zeros(numImagedPoints, numTimePtsCollectionDuration);
          summed_lifetime_data_all     = zeros(numImagedPoints, numTimePtsCollectionDuration);
          normalized_lifetime_data_all = zeros(numImagedPoints, numTimePtsCollectionDuration);
          stdev_lifetime_data_all      = zeros(numImagedPoints, numTimePtsCollectionDuration);

          lifetimes_all   =  zeros(numImagedPoints,3);
          pO2_all         =  zeros(numImagedPoints,1);
          pO2_all_SternVolmer =  zeros(numImagedPoints,1);
          pO2_std_err_all =  zeros(numImagedPoints,1);
          pO2_std_err_all_SternVolmer =  zeros(numImagedPoints,1);
          
          lt_confidence_intervals_all  = zeros(numImagedPoints, 2);
          lt_std_err_all  =  zeros(numImagedPoints, 1);
       
          lt_fit_profile_all = zeros(numImagedPoints,length(lt_fit_time));

          numRepsInSubDecay = numSinglePointAverages;
          dataStruct.numRepsInSubDecay = numRepsInSubDecay;
          numSubDecayGroups = round(double(numSinglePointAverages)/numRepsInSubDecay);

          if flagFirstLoop
             excludePoints = zeros(numImagedPoints,1); % 0 to keep the point, 1 to exclude the point
             excludeSubGroups = zeros(numImagedPoints,numSubDecayGroups); % 0 is subDecayGroup is o.k., 1 if needs to be excluded
          end
          dataStruct.numSubDecayGroups = numSubDecayGroups;
          % reserve memory for sub decay processing
          sub_summed_lifetime_data  = zeros (numImagedPoints, numSubDecayGroups, numTimePtsCollectionDuration);
          sub_mean_lifetime_data  = zeros (numImagedPoints, numSubDecayGroups, numTimePtsCollectionDuration);
          sub_stdev_lifetime_data  = zeros (numImagedPoints, numSubDecayGroups, numTimePtsCollectionDuration);
          sub_normalized_lifetime_data  = zeros (numImagedPoints, numSubDecayGroups, numTimePtsCollectionDuration);

          sub_lifetimes = zeros(numImagedPoints,numSubDecayGroups,3);
          sub_pO2 = zeros(numImagedPoints,numSubDecayGroups);
          sub_pO2_SternVolmer = zeros(numImagedPoints,numSubDecayGroups);
          sub_pO2_std_err = zeros(numImagedPoints,numSubDecayGroups);
          sub_pO2_std_err_SternVolmer = zeros(numImagedPoints,numSubDecayGroups);
          
          sub_lt_confidence_intervals  = zeros(numImagedPoints,numSubDecayGroups, 2);
          sub_lt_std_err  = zeros(numImagedPoints,numSubDecayGroups);

          sub_lt_fit_profile = zeros(numImagedPoints,numSubDecayGroups,length(lt_fit_time));

          subDecIdx = 1:numRepsInSubDecay;
          for j = 1:numImagedPoints
              disp(['Processing point ' num2str(j) ' out of ' num2str(numImagedPoints) ' points...']); pause(0.001);
              decay_index_offset = (j-1)*numSinglePointAverages;
              decay_indices_all = [1:numSinglePointAverages] + decay_index_offset;
              decay_indices = [];
              for kkk = 1:numSubDecayGroups  % create indexes only for sub decays that are acceptable
                  if excludeSubGroups(j,kkk)==0
                     decay_indices = [decay_indices (subDecIdx+(kkk-1)*numRepsInSubDecay)];
                  end
              end  
              decay_indices = decay_indices+decay_index_offset;
              if isempty(decay_indices), % if all sub groups are excluded, this point is not valid
                 excludePoints(j)=1;
              else
                 % remove outliers
                 bbb = sum(binned_data(decay_indices,:),2);
                 [bbbidx,bbboutliers] = deleteOutliers(bbb);
                 decay_indices(bbbidx) = [];
                 removedOutliers(j) = length(bbbidx);
                 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                 summed_lifetime_data (j,:) = sum(binned_data(decay_indices,:),1);
                 mean_lifetime_data (j,:) = mean(binned_data(decay_indices,:),1);
                 stdev_lifetime_data (j,:) = std(binned_data(decay_indices,:),1);
                 if summed_lifetime_data (j,fittedDecayTimePoints_indices(1)) == 0
                    normalized_lifetime_data (j,:) = 0;
                 else
                    normalized_lifetime_data (j,:) = summed_lifetime_data (j,:)./summed_lifetime_data (j,fittedDecayTimePoints_indices(1));
                 end
                 c0(1) = normalized_lifetime_data(j,1);
                 c0(2) = squeeze(sum(normalized_lifetime_data(j,fittedDecayTimePoints_indices))) * bin_interval_us / c0(1);
                 c0(3) = 0;

                 [cAll,resnorm,resid,exitflag,output,lambda,jacobian_c] = ...
                       lsqnonlin(decay_profile_error, c0, [],[],MyOptions,fittedDecayTimePoints_us',...
                       (normalized_lifetime_data(j,fittedDecayTimePoints_indices))');
                 lifetimes(j,:) = cAll;
                 c_ci = nlparci(cAll,resid,'jacobian',jacobian_c,'alpha',0.05);
                 lt_confidence_intervals (j,:) = c_ci(2,:);
                 lt_std_err(j) = (c_ci(2,2) - c_ci(2,1)) / 3.92;   % assume the CI is symmetric, 95% corresponds to 1.96 * std err

                 pO2(j) = sA1.*exp(-lifetimes(j,2)./st1)+sA2.*exp(-lifetimes(j,2)./st2)+sy0;
                 pO2_std_err(j) = sqrt(((-(sA1/st1).*exp(-lifetimes(j,2)./st1)*lt_std_err(j)-(sA2/st2).*exp(-lifetimes(j,2)./st2)*lt_std_err(j)))^2);
                 pO2_rel_err(j) = pO2_std_err(j) / pO2(j);
                 
                 pO2_SternVolmer(j) = 1/(kq0+beta*temperature)*(1/(a*lifetimes(j,2)^p)-1/(tau0+alpha*temperature));
                 pO2_std_err_SternVolmer(j) = sqrt((-p/a/(kq0+beta*temperature)/lifetimes(j,2)^(p+1)*lt_std_err(j))^2);
                 pO2_rel_err_SternVolmer(j) = pO2_std_err_SternVolmer(j)/pO2_SternVolmer(j);
                 
                 lt_fit_profile (j,:) = feval(decay_profile, cAll, lt_fit_time);
                 legend_names(j) =  cellstr([num2str(j,2) ' : ' num2str(pO2(j),3) ' \pm ' num2str(pO2_std_err(j),3) ' mmHg']);
              end
              % do the same processing on data from all sub decays (accepted and excluded)
              summed_lifetime_data_all (j,:) = sum(binned_data(decay_indices_all,:),1);
              mean_lifetime_data_all (j,:) = mean(binned_data(decay_indices_all,:),1);
              stdev_lifetime_data_all (j,:) = std(binned_data(decay_indices_all,:),1);
              if summed_lifetime_data_all (j,fittedDecayTimePoints_indices(1)) == 0,
                 normalized_lifetime_data_all (j,:) = 0;
              else
                 normalized_lifetime_data_all (j,:) = summed_lifetime_data_all (j,:)./summed_lifetime_data_all (j,fittedDecayTimePoints_indices(1));
              end
              c0(1) = normalized_lifetime_data_all(j,1);
              c0(2) = squeeze(sum(normalized_lifetime_data_all(j,fittedDecayTimePoints_indices))) * bin_interval_us / c0(1);
              c0(3) = 0;

              [cAll,resnorm,resid,exitflag,output,lambda,jacobian_c] = ...
                   lsqnonlin(decay_profile_error, c0, [],[],MyOptions,fittedDecayTimePoints_us',...
                   (normalized_lifetime_data_all(j,fittedDecayTimePoints_indices))');
              lifetimes_all(j,:) = cAll;
              c_ci = nlparci(cAll,resid,'jacobian',jacobian_c,'alpha',0.05);

              lt_confidence_intervals_all (j,:) = c_ci(2,:);
              lt_std_err_all(j) = (c_ci(2,2) - c_ci(2,1)) / 3.92;   % assume the CI is symmetric, 95% corresponds to 1.96 * std err

              pO2_all(j) = sA1.*exp(-lifetimes_all(j,2)./st1)+sA2.*exp(-lifetimes_all(j,2)./st2)+sy0;
              pO2_std_err_all(j) = sqrt((     (-(sA1/st1).*exp(-lifetimes_all(j,2)./st1)*lt_std_err_all(j)-(sA2/st2).*exp(-lifetimes_all(j,2)./st2)*lt_std_err_all(j) )  *lt_std_err_all(j))^2);

              pO2_all_SternVolmer(j) = 1/(kq0+beta*temperature)*(1/(a*lifetimes_all(j,2)^p)-1/(tau0+alpha*temperature));
              pO2_std_err_all_SternVolmer(j) = sqrt((-p/a/(kq0+beta*temperature)/lifetimes_all(j,2)^(p+1)*lt_std_err_all(j))^2);
              
              lt_fit_profile_all (j,:) = feval(decay_profile, cAll, lt_fit_time);
              legend_names(j) =  cellstr([num2str(j,2) ' : ' num2str(pO2_all(j),3) ' \pm ' num2str(pO2_std_err_all(j),3) ' mmHg']);

              % now do calculation in subdecays...
              for idxSubDecays = 1:numSubDecayGroups
                  subdecay_index_offset = (j-1)*numSinglePointAverages+(idxSubDecays-1)*numRepsInSubDecay;
                  sub_decay_indices = [1:numRepsInSubDecay] + subdecay_index_offset;
                  sub_summed_lifetime_data (j,idxSubDecays,:) = sum(binned_data(sub_decay_indices,:),1);
                  sub_mean_lifetime_data (j,idxSubDecays,:) = mean(binned_data(sub_decay_indices,:),1);
                  sub_stdev_lifetime_data (j,idxSubDecays,:) = std(binned_data(sub_decay_indices,:),1);
                  if sub_summed_lifetime_data (j,idxSubDecays,fittedDecayTimePoints_indices(1)) == 0,
                     sub_normalized_lifetime_data (j,idxSubDecays,:) = 0;
                  else
                     sub_normalized_lifetime_data (j,idxSubDecays,:) = sub_summed_lifetime_data (j,idxSubDecays,:)./sub_summed_lifetime_data (j,idxSubDecays,fittedDecayTimePoints_indices(1));
                  end
                  c0 = cAll;
                  decayIntensities=squeeze(sub_normalized_lifetime_data(j,idxSubDecays,fittedDecayTimePoints_indices));
                  [c,resnorm,resid,exitflag,output,lambda,jacobian_c] = ...
                  lsqnonlin(decay_profile_error, c0, [],[],MyOptions,fittedDecayTimePoints_us',decayIntensities);
                  sub_lifetimes(j,idxSubDecays,:) = c;
                  c_ci = nlparci(c,resid,'jacobian',jacobian_c,'alpha',0.05);
                  sub_lt_confidence_intervals (j,idxSubDecays,:) = c_ci(2,:);
                  sub_lt_std_err(j,idxSubDecays) = (c_ci(2,2) - c_ci(2,1)) / 3.92;   %%assume the CI is symmetric, 95% corresponds to 1.96 * std err

                  sub_pO2(j,idxSubDecays) = sA1.*exp(-sub_lifetimes(j,idxSubDecays,2)./st1)+sA2.*exp(-sub_lifetimes(j,idxSubDecays,2)./st2)+sy0;
                  sub_pO2_std_err(j,idxSubDecays) = sqrt(((-(sA1/st1).*exp(-sub_lifetimes(j,idxSubDecays,2)./st1)*sub_lt_std_err(j,idxSubDecays)...
                   -(sA2/st2).*exp(-sub_lifetimes(j,idxSubDecays,2)./st2)*sub_lt_std_err(j,idxSubDecays) )  *sub_lt_std_err(j,idxSubDecays))^2);

                  sub_pO2_SternVolmer(j,idxSubDecays) = 1/(kq0+beta*temperature)*(1/(a*sub_lifetimes(j,idxSubDecays,2)^p)-1/(tau0+alpha*temperature));
                  sub_pO2_std_err_SternVolmer(j,idxSubDecays) = sqrt((-p/a/(kq0+beta*temperature)/sub_lifetimes(j,idxSubDecays,2)^(p+1)*sub_lt_std_err(j,idxSubDecays))^2);
                  
                  sub_lt_fit_profile (j,idxSubDecays,:) = feval(decay_profile, c, lt_fit_time);
                  sub_legend_names(j,idxSubDecays) =  cellstr([num2str(j,2) ', ' num2str(idxSubDecays,3) ' : ' num2str(sub_pO2(j,idxSubDecays),3) ' \pm ' num2str(sub_pO2_std_err(j,idxSubDecays),3) ' mmHg']);
              end
          end 
          stdev_lifetime_data = stdev_lifetime_data./ sqrt(double(numSinglePointAverages));

          dataStruct.sub_mean_lifetime_data = sub_mean_lifetime_data;
          dataStruct.sub_summed_lifetime_data = sub_summed_lifetime_data;
          dataStruct.sub_normalized_lifetime_data = sub_normalized_lifetime_data;
          dataStruct.sub_stdev_lifetime_data = sub_stdev_lifetime_data;
          dataStruct.sub_lifetimes = sub_lifetimes;
          dataStruct.sub_pO2 = sub_pO2;
          dataStruct.sub_pO2_SternVolmer = sub_pO2_SternVolmer;
          dataStruct.sub_pO2_std_err = sub_pO2_std_err;
          dataStruct.sub_pO2_std_err_SternVolmer = sub_pO2_std_err_SternVolmer;
          dataStruct.sub_lt_confidence_intervals = sub_lt_confidence_intervals;
          dataStruct.sub_lt_std_err = sub_lt_std_err;
          dataStruct.sub_lt_fit_profile = sub_lt_fit_profile;

          dataStruct.mean_lifetime_data = mean_lifetime_data;
          dataStruct.summed_lifetime_data = summed_lifetime_data;
          dataStruct.normalized_lifetime_data = normalized_lifetime_data;
          dataStruct.stdev_lifetime_data = stdev_lifetime_data;
          dataStruct.lifetimes = lifetimes;
          dataStruct.pO2 = pO2;
          dataStruct.pO2_SternVolmer = pO2_SternVolmer;
          dataStruct.pO2_std_err = pO2_std_err;
          dataStruct.pO2_std_err_SternVolmer = pO2_std_err_SternVolmer;
          dataStruct.pO2_rel_err = pO2_rel_err;
          dataStruct.pO2_rel_err_SternVolmer = pO2_rel_err_SternVolmer;         
          dataStruct.lt_confidence_intervals = lt_confidence_intervals;
          dataStruct.lt_std_err = lt_std_err;
          dataStruct.lt_fit_time = lt_fit_time;
          dataStruct.lt_fit_profile = lt_fit_profile;

          mean_pO2 = zeros(numImagedPoints,1);
          for j=1:numImagedPoints
              if excludePoints(j)==0
                  mean_pO2(j) = squeeze(mean(  squeeze(sub_pO2(j,find(squeeze(excludeSubGroups(j,:))==0)) )));
              end
          end
          dataStruct.mean_pO2 = mean_pO2;

          dataStruct.ALL.mean_lifetime_data_all = mean_lifetime_data_all;
          dataStruct.ALL.summed_lifetime_data_all = summed_lifetime_data_all;
          dataStruct.ALL.normalized_lifetime_data_all = normalized_lifetime_data_all;
          dataStruct.ALL.stdev_lifetime_data_all = stdev_lifetime_data_all;
          dataStruct.ALL.lifetimes_all = lifetimes_all;
          dataStruct.ALL.pO2_all = pO2_all;
          dataStruct.ALL.pO2_all_SternVolmer = pO2_all_SternVolmer;
          dataStruct.ALL.pO2_std_err_all = pO2_std_err_all;
          dataStruct.ALL.pO2_std_err_all_SternVolmer = pO2_std_err_all_SternVolmer;
          dataStruct.ALL.lt_confidence_intervals_all = lt_confidence_intervals_all;
          dataStruct.ALL.lt_std_err_all = lt_std_err_all;
          dataStruct.ALL.lt_fit_time_all = lt_fit_time;
          dataStruct.ALL.lt_fit_profile_all = lt_fit_profile_all;

          mean_pO2_all = zeros(numImagedPoints,1);
          mean_pO2_all = squeeze(mean(sub_pO2,2));
          dataStruct.ALL.mean_pO2_all = mean_pO2_all;
          %%%%%  Save dataStruct_delay5.mat file
          dataStruct.surveyImage = survey_image;
          dataStruct.surveyImage1 = survey_image1;
    
          summary.Data = zeros(numImagedPoints,6);
          summary.Data(:,1) = [1:numImagedPoints];
          summary.Data(:,2) = lifetimes(:,2);
          summary.Data(:,3) = lt_std_err(:);
          summary.Data(:,4) = mean_pO2(:);
          summary.Data(:,5) = pO2_std_err(:);
          summary.Data(:,6) = (summed_lifetime_data (:,fittedDecayTimePoints_indices(1)));
          summary.Columns = {'Point number';'Lifetime';'Lifetime error';'pO2';'pO2 error';'Amplitude (photons)'};
          dataStruct.summary = summary;
          dataStruct.excludePoints = excludePoints;
          dataStruct.excludeSubGroups = excludeSubGroups;
    
          fnameDataStruct = [resultpath{path_index} 'dataStruct_delay' num2str(delayInterval) '.mat'];
          save(fnameDataStruct,'dataStruct','-mat','-v7.3'); 
          %%% Create dat files for Sergei's code
          tt = dataStruct.fittedDecayTimePoints_us;
          tt = tt';
          data = squeeze(dataStruct.summed_lifetime_data(:,dataStruct.fittedDecayTimePoints_indices));
          data = data';
          toExport = [tt data];
          newFname = [fnameDataStruct(1:end-4) '_OnlyDecays.dat'];
          save(newFname,'toExport','-ascii');  
          
          %%% Using Sergei's code if temp is not 36.6 degree
          if temperature == 36.6
             %%%%%  Save pO2 and pO2 relative error files 
             fileID_pO2 = fopen([resultpath{path_index} 'pO2.txt'], 'w');
             fprintf(fileID_pO2, '%16e\n', pO2);
             fclose(fileID_pO2);
             
             fileID_pO2Err = fopen([resultpath{path_index} 'pO2_rel_err.txt'], 'w');
             fprintf(fileID_pO2Err, '%16e\n', pO2_rel_err);
             fclose(fileID_pO2Err);
             %%%%%%%%%%%%%%%%%%%%% plot figures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             surveyFig = figure(1);
             clf;
             fgPts = subplot(2,2,1);
             %%% plot first image and decide on contrast 
             MinMinS = min(survey_image1(:));
             MaxMaxS = max(survey_image1(:));
             fgPts = subplot(2,2,1);      
             hSrv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             daspect([1 1 1]);
             colormap([gray(64);jet(64)]); %colormap(gray(64));
             cbSrv = colorbar;
             ncmp = 64;
             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );
             set(hSrv,'CDataMapping','Direct');
             set(hSrv,'CData',c_Surv);
             subplot(fgPts);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbSrv,'YLim',[1 ncmp]);
             newTicks = 1:10:ncmp;
             newTickLabels = newTicks.*(maxSurv-minSurv)./(ncmp-1)+(minSurv*ncmp-maxSurv)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbSrv,'YTick',newTicks);
             set(cbSrv,'YTickLabel',newTickLabelsStr);
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('Points on survey image');
             set(surveyFig,'Position',[150 150 1200 900]);
             set(gca,'Position',[0.07 0.57 0.3 0.4]);
             set(gca,'nextplot','replacechildren');
             % plot position of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 2, 2],...
                  'Curvature',[1,1],'FaceColor','r');
                 daspect ([1,1,1])
                 text((selected_points_indices(i,3) - 5),(selected_points_indices(i,2) - 5),[num2str(i)],...
                  'FontSize',10,'FontWeight', 'Bold','Color',clr);
             end
             %%% plot pO2 points on second image
             fgPO2 = subplot(2,2,2);
             title('pO2 (mmHg)');
             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbPO2 = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('pO2 values');
             set(gca,'Position',[0.55 0.57 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);
            % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;
             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );

             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgPO2);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbPO2,'YLim',[ncmp+1 2*ncmp]);
             % create proper colormap
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapPO2idx = ones(length(pO2),1); % vector of colormap indexes for pO2
             if flagFirstLoop
                minPO2 = min(pO2);
                maxPO2 = max(pO2);
             end
             pO2forPlot = pO2;
             pO2forPlot(find(pO2<=minPO2))=minPO2;
             pO2forPlot(find(pO2>=maxPO2))=maxPO2;
             if maxPO2 == minPO2
                cmapPO2idx = cmapPO2idx.*round(CmapN/2);
             else
                cmapPO2idx = round(   (  CmapN.*(pO2forPlot-minPO2)+maxPO2-pO2forPlot  )    ./(maxPO2-minPO2) );
                cmapPO2idx(find(cmapPO2idx <= 0)) = 1;
                cmapPO2idx(find(cmapPO2idx > CmapN)) = CmapN;
             end
             %%% plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapPO2idx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                  'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end
             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxPO2-minPO2)./(ncmp-1)+(minPO2*ncmp-maxPO2)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbPO2,'YTick',newTicks+ncmp);
             set(cbPO2,'YTickLabel',newTickLabelsStr);
             %%% then plot rel error of pO2
             %%% plot pO2 points on second image
             fgPO2relErr = subplot(2,2,3);
             title('pO2_relErr');
             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbPO2err = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('pO2 Relative Error');
             set(gca,'Position',[0.07 0.07 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);
             % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;
             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );
             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgPO2relErr);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbPO2err,'YLim',[ncmp+1 2*ncmp]);
             % create proper colormap
             pO2_rel_err = abs(pO2_rel_err);
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapPO2relErrIdx = ones(length(pO2_rel_err),1); % vector of colormap indexes for pO2
             if flagFirstLoop
                minPO2relErr = min(pO2_rel_err);
                maxPO2relErr = max(pO2_rel_err);
             end
             pO2_rel_err_forPlot = pO2_rel_err;
             pO2_rel_err_forPlot(find(pO2_rel_err<=minPO2relErr))=minPO2relErr;
             pO2_rel_err_forPlot(find(pO2_rel_err>=maxPO2relErr))=maxPO2relErr;
             if maxPO2relErr == minPO2relErr
                cmapPO2relErrIdx = cmapPO2relErrIdx.*round(CmapN/2);
             else
                cmapPO2relErrIdx = round(   (  CmapN.*(pO2_rel_err_forPlot-minPO2relErr)+maxPO2relErr-pO2_rel_err_forPlot  )    ./(maxPO2relErr-minPO2relErr) );
                cmapPO2relErrIdx(find(cmapPO2relErrIdx <= 0)) = 1;
                cmapPO2relErrIdx(find(cmapPO2relErrIdx > CmapN)) = CmapN;
             end
             %%% plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapPO2relErrIdx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                 'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end
             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxPO2relErr-minPO2relErr)./(ncmp-1)+(minPO2relErr*ncmp-maxPO2relErr)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbPO2err,'YTick',newTicks+ncmp);
             set(cbPO2err,'YTickLabel',newTickLabelsStr);
             %%% plot number of collected photons (baseline removed) for each point
             %%% summed_lifetime_data     = zeros(numImagedPoints, numTimePtsCollectionDuration);
             numDetectedPhotons = squeeze(sum(summed_lifetime_data (:,fittedDecayTimePoints_indices),2)) - squeeze(mean( summed_lifetime_data(:,fittedDecayTimePoints_indices(end-20:end)) ,2)) .* length(fittedDecayTimePoints_indices);
             fgNumPhot = subplot(2,2,4);
             title('Number of Photons in Decay (no baseline)');
             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbNumPhot = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('Number of Photons in Decay (no baseline)');
             set(gca,'Position',[0.55 0.07 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);
             % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;
             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );
             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgNumPhot);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbNumPhot,'YLim',[ncmp+1 2*ncmp]);
             % create proper colormap
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapNumPhotIdx = ones(length(numDetectedPhotons),1); % vector of colormap indexes for pO2
             if flagFirstLoop
                minNumPhot = min(numDetectedPhotons);
                maxNumPhot = max(numDetectedPhotons);
             end
             numDetectedPhotons_forPlot = numDetectedPhotons;
             numDetectedPhotons_forPlot(find(numDetectedPhotons<=minNumPhot))=minNumPhot;
             numDetectedPhotons_forPlot(find(numDetectedPhotons>=maxNumPhot))=maxNumPhot;
             if maxNumPhot == minNumPhot
                cmapNumPhotIdx = cmapNumPhotIdx.*round(CmapN/2);
             else
                cmapNumPhotIdx = round(   (  CmapN.*(numDetectedPhotons_forPlot-minNumPhot)+maxNumPhot-numDetectedPhotons_forPlot  )    ./(maxNumPhot-minNumPhot) );
                cmapNumPhotIdx(find(cmapNumPhotIdx <= 0)) = 1;
                cmapNumPhotIdx(find(cmapNumPhotIdx > CmapN)) = CmapN;
             end
             %%% plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapNumPhotIdx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                  'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end
             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxNumPhot-minNumPhot)./(ncmp-1)+(minNumPhot*ncmp-maxNumPhot)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbNumPhot,'YTick',newTicks+ncmp);
             set(cbNumPhot,'YTickLabel',newTickLabelsStr);
             fnameJPG = [resultpath{path_index} 'pO2_points_delay' num2str(delayInterval) '.jpg'];
             print(surveyFig,'-djpeg',fnameJPG,'-r300');
             %%% plot lifetimes and pO2's to see how imaging went...
             quest_tpsfplot = 'Plot and save TPSFs ?';
             answer_tpsfplot = questdlg(quest_tpsfplot,'Plot TPSFs ?','Yes','No','No');   
             switch answer_tpsfplot
                 case 'Yes'
                    close(surveyFig);  
                    fnameControl = [resultpath{path_index} 'controll_delay' num2str(delayInterval) '.tif'];
                    flagChange = 0; % is there any change in rejected sub decays
                    numberFitsToPlot = numImagedPoints;
                    for nn = 1:numberFitsToPlot
                        hftmp = figure(100+nn); 
                        hold off;
                        set(hftmp,'Position',get(0,'ScreenSize'));
                        fooIdx = [];
                        hflll = subplot(1,1,1); % plot logaritmic decays
                        hold on;
                        if excludePoints(nn) == 0
                           semilogy(t(fittedDecayTimePoints_indices), (lifetimes(nn,1).*exp(-fittedDecayTimePoints_us./lifetimes(nn,2))+lifetimes(nn,3)) .* summed_lifetime_data (nn,fittedDecayTimePoints_indices(1)),'k','LineWidth',2 );
                           semilogy(t,summed_lifetime_data(nn,:),'.b');
                           ltm = ['lifetime = ' sprintf('%3.1f',lifetimes(nn,2)) ' us'];
                           legendstr = {sprintf('%20s',ltm)};
                           legendstr = [legendstr sprintf('%20s','sum decays')];
                        end
                        semilogy(t,squeeze(sub_summed_lifetime_data(nn,:,:)));
                        if ~isempty(fooIdx)
                           semilogy(t,squeeze(sub_summed_lifetime_data(nn,fooIdx,:)),'k');
                        end
                        set(hflll,'YScale','log');
                        xlabel('Time (us)');
                        title(['Sub- and total decay. Removed outliers from total: ' num2str(removedOutliers(nn))]);
                        if excludePoints(nn)==0
                           legend(legendstr);
                        else
                           legend('This point is excluded');
                        end
                        print(hftmp,'temp.tif','-dtiff');
                        AAA = imread('temp.tif');
                        imwrite(AAA,fnameControl,'tiff','WriteMode','append');
                        close(hftmp);
                        % ask if some sub-decays are to be removed
                        fooIdx = find(squeeze(excludeSubGroups(nn,:))==1);
                        if isempty(fooIdx)
                           excludedSoFar = {'none'};
                        else
                           excludedSoFar = ' ';
                           for ifoo = 1:length(fooIdx)
                               excludedSoFar = [excludedSoFar ' ' num2str(fooIdx(ifoo))];
                           end
                           excludedSoFar = {excludedSoFar};
                        end
                        excludeInput{1} = 'none';
                        if ~strcmp(excludeInput{1},'none')
                            excludeInput = str2num(excludeInput{1});
                            if ~isequal(excludeInput, fooIdx)
                                flagChange = 1;
                                excludeSubGroups(nn,excludeInput)=1;
                                if isempty(find(excludeSubGroups(nn,:)==0))
                                    excludePoints(nn)=1;
                                end
                            end
                        else
                           if ~isempty(fooIdx)
                              flagChange = 1;
                              excludeSubGroups(nn,:)=0;
                              excludePoints(nn)=0;
                           end
                        end
                    end 
                    if flagChange
                       delete(fnameControl);
                    end
                    delete('temp.tif');
                    % close all;
                    flagDone = ~flagChange;
                    flagFirstLoop = 0; 
                 case 'No' 
                    close(surveyFig);  
                    flagDone = 1;
             end 
          else
             %%% using SternVolmer model for pO2  
             %%%  Save pO2 and pO2 relative error files based on SternVolmer model
             fileID_pO2SternVolmer = fopen([resultpath{path_index} 'pO2_SternVolmer.txt'], 'w');
             fprintf(fileID_pO2SternVolmer, '%16e\n', pO2_SternVolmer);
             fclose(fileID_pO2SternVolmer);
             
             fileID_pO2ErrSternVolmer = fopen([resultpath{path_index} 'pO2_rel_err_SternVolmer.txt'], 'w');
             fprintf(fileID_pO2ErrSternVolmer, '%16e\n', pO2_rel_err_SternVolmer);
             fclose(fileID_pO2ErrSternVolmer);
             %%%%%%%%%%%%%%%%%%%%% plot figures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             surveyFig = figure(1);
             clf;
             fgPts = subplot(2,2,1);
             %%% plot first image and decide on contrast 
             MinMinS = min(survey_image1(:));
             MaxMaxS = max(survey_image1(:));                 
    
             hSrv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             daspect([1 1 1]);
             colormap([gray(64);jet(64)]); %colormap(gray(64));
             cbSrv = colorbar;
             ncmp = 64;

             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );
             set(hSrv,'CDataMapping','Direct');
             set(hSrv,'CData',c_Surv);
             subplot(fgPts);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbSrv,'YLim',[1 ncmp]);

             newTicks = 1:10:ncmp;
             newTickLabels = newTicks.*(maxSurv-minSurv)./(ncmp-1)+(minSurv*ncmp-maxSurv)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbSrv,'YTick',newTicks);
             set(cbSrv,'YTickLabel',newTickLabelsStr);

             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('Points on survey image');
             set(surveyFig,'Position',[150 150 1200 900]);
             set(gca,'Position',[0.07 0.57 0.3 0.4]);
             set(gca,'nextplot','replacechildren');
             % plot position of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 2, 2],...
                   'Curvature',[1,1],'FaceColor','r');
                 daspect ([1,1,1])
                 text((selected_points_indices(i,3) - 5),(selected_points_indices(i,2) - 5),[num2str(i)],...
                   'FontSize',10,'FontWeight', 'Bold','Color',clr);
             end
             %%% plot pO2 points on second image
             fgPO2 = subplot(2,2,2);
             title('pO2 (mmHg)');

             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbPO2 = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('pO2 values');
             set(gca,'Position',[0.55 0.57 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);
             % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;

             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );

             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgPO2);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbPO2,'YLim',[ncmp+1 2*ncmp]);

             % create proper colormap
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapPO2idx = ones(length(pO2_SternVolmer),1); % vector of colormap indexes for pO2
             if flagFirstLoop
                minPO2 = min(pO2_SternVolmer);
                maxPO2 = max(pO2_SternVolmer);
             end
             
             pO2forPlot = pO2_SternVolmer;
             pO2forPlot(find(pO2_SternVolmer<=minPO2))=minPO2;
             pO2forPlot(find(pO2_SternVolmer>=maxPO2))=maxPO2;

             if maxPO2 == minPO2
                cmapPO2idx = cmapPO2idx.*round(CmapN/2);
             else
                cmapPO2idx = round(   (  CmapN.*(pO2forPlot-minPO2)+maxPO2-pO2forPlot  )    ./(maxPO2-minPO2) );
                cmapPO2idx(find(cmapPO2idx <= 0)) = 1;
                cmapPO2idx(find(cmapPO2idx > CmapN)) = CmapN;
             end
             % plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapPO2idx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                  'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end

             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxPO2-minPO2)./(ncmp-1)+(minPO2*ncmp-maxPO2)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbPO2,'YTick',newTicks+ncmp);
             set(cbPO2,'YTickLabel',newTickLabelsStr);  
             %%% then plot rel error of pO2
             %%% plot pO2 points on second image
             fgPO2relErr = subplot(2,2,3);
             title('pO2_relErr');

             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbPO2err = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('pO2 Relative Error');
             set(gca,'Position',[0.07 0.07 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);

             % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;

             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );

             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgPO2relErr);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbPO2err,'YLim',[ncmp+1 2*ncmp]);

             %%% create proper colormap
             pO2_rel_err_SternVolmer = abs(pO2_rel_err_SternVolmer);
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapPO2relErrIdx = ones(length(pO2_rel_err_SternVolmer),1); % vector of colormap indexes for pO2
             minPO2relErr = min(pO2_rel_err_SternVolmer);
             maxPO2relErr = max(pO2_rel_err_SternVolmer);

             pO2_rel_err_forPlot = pO2_rel_err;
             pO2_rel_err_forPlot(find(pO2_rel_err<=minPO2relErr))=minPO2relErr;
             pO2_rel_err_forPlot(find(pO2_rel_err>=maxPO2relErr))=maxPO2relErr;
             if maxPO2relErr == minPO2relErr
                cmapPO2relErrIdx = cmapPO2relErrIdx.*round(CmapN/2);
             else
                cmapPO2relErrIdx = round(   (  CmapN.*(pO2_rel_err_forPlot-minPO2relErr)+maxPO2relErr-pO2_rel_err_forPlot  )    ./(maxPO2relErr-minPO2relErr) );
                cmapPO2relErrIdx(find(cmapPO2relErrIdx <= 0)) = 1;
                cmapPO2relErrIdx(find(cmapPO2relErrIdx > CmapN)) = CmapN;
             end
             %%% plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapPO2relErrIdx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                 'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end
             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxPO2relErr-minPO2relErr)./(ncmp-1)+(minPO2relErr*ncmp-maxPO2relErr)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbPO2err,'YTick',newTicks+ncmp);
             set(cbPO2err,'YTickLabel',newTickLabelsStr);
      
             %%% plot number of collected photons (baseline removed) for each point
             %%% summed_lifetime_data     = zeros(numImagedPoints, numTimePtsCollectionDuration);
             numDetectedPhotons = squeeze(sum(summed_lifetime_data (:,fittedDecayTimePoints_indices),2)) - squeeze(mean( summed_lifetime_data(:,fittedDecayTimePoints_indices(end-20:end)) ,2)) .* length(fittedDecayTimePoints_indices);
             fgNumPhot = subplot(2,2,4);
             title('Number of Photons in Decay (no baseline)');

             hSurv = imagesc(survey_image1,[MinMinS MaxMaxS]); 
             cbNumPhot = colorbar;
             xlabel('X (pixels)');
             ylabel('Y (pixels)');
             set(get(gca,'YLabel'),'FontSize',15);
             set(get(gca,'YLabel'),'FontWeight','Bold');
             set(get(gca,'XLabel'),'FontSize',15);
             set(get(gca,'XLabel'),'FontWeight','Bold');
             set(gca,'FontSize',15);
             set(gca,'FontWeight','Bold');
             title('Number of Photons in Decay (no baseline)');
             set(gca,'Position',[0.55 0.07 0.3 0.4]); 
             set(gca,'nextplot','replacechildren');
             daspect([1 1 1]);

             % change colormap
             colormap([gray(64);jet(64)]);
             ncmp=64;

             maxSurv = MaxMaxS; %max(survey_image1(:));
             minSurv = MinMinS; %min(survey_image1(:));
             c_Surv = min(ncmp,  round(   (ncmp-1).*(survey_image1-minSurv)./(maxSurv-minSurv)  )+1  );

             set(hSurv,'CDataMapping','Direct');
             set(hSurv,'CData',c_Surv);
             subplot(fgNumPhot);
             caxis([min(c_Surv(:)) max(c_Surv(:))]);
             set(cbNumPhot,'YLim',[ncmp+1 2*ncmp]);

             % create proper colormap
             cmap1=jet(64);
             CmapN = size(cmap1,1); % length of colormap[N,3] matrix is N
             cmapNumPhotIdx = ones(length(numDetectedPhotons),1); % vector of colormap indexes for pO2
             if flagFirstLoop
                minNumPhot = min(numDetectedPhotons);
                maxNumPhot = max(numDetectedPhotons);
             end

             numDetectedPhotons_forPlot = numDetectedPhotons;
             numDetectedPhotons_forPlot(find(numDetectedPhotons<=minNumPhot))=minNumPhot;
             numDetectedPhotons_forPlot(find(numDetectedPhotons>=maxNumPhot))=maxNumPhot;
             if maxNumPhot == minNumPhot
                cmapNumPhotIdx = cmapNumPhotIdx.*round(CmapN/2);
             else
                cmapNumPhotIdx = round(   (  CmapN.*(numDetectedPhotons_forPlot-minNumPhot)+maxNumPhot-numDetectedPhotons_forPlot  )    ./(maxNumPhot-minNumPhot) );
                cmapNumPhotIdx(find(cmapNumPhotIdx <= 0)) = 1;
                cmapNumPhotIdx(find(cmapNumPhotIdx > CmapN)) = CmapN;
             end
             % plot pO2 of points on image  
             for i = 1:numImagedPoints
                 if excludePoints(i)==0
                    clr = 'r';
                 else
                    clr = 'y';
                 end
                 colMap = squeeze(cmap1(cmapNumPhotIdx(i),:));
                 rectangle('Position',[(selected_points_indices(i,3) - 1),(selected_points_indices(i,2) - 1), 3, 3],...
                   'Curvature',[1,1],'FaceColor',colMap);
                 daspect ([1,1,1]);
             end

             newTicks = 10:10:ncmp;
             newTickLabels = newTicks.*(maxNumPhot-minNumPhot)./(ncmp-1)+(minNumPhot*ncmp-maxNumPhot)/(ncmp-1);
             newTickLabelsStr=num2str(newTickLabels(1),2);
             for idxLab = 2:length(newTickLabels)
                 newTickLabelsStr = char(newTickLabelsStr,num2str(newTickLabels(idxLab),2));
             end
             set(cbNumPhot,'YTick',newTicks+ncmp);
             set(cbNumPhot,'YTickLabel',newTickLabelsStr);

             fnameJPG = [resultpath{path_index} 'pO2_points_delay' num2str(delayInterval) '_SternVolmer.jpg'];
             print(surveyFig,'-djpeg',fnameJPG,'-r300');
             %%% plot lifetimes and pO2's to see how imaging went...
             quest_tpsfplot = 'Plot and save TPSFs ?';
             answer_tpsfplot = questdlg(quest_tpsfplot,'Plot TPSFs ?','Yes','No','No');   
             switch answer_tpsfplot
                 case 'Yes'
                    close(surveyFig);   
                    fnameControl = [resultpath{path_index} 'controll_delay' num2str(delayInterval) '.tif'];
                    flagChange = 0; %%% is there any change in rejected sub decays
                    numberFitsToPlot = numImagedPoints;
                    for nn = 1:numberFitsToPlot
                        hftmp = figure(100+nn); 
                        hold off;
                        set(hftmp,'Position',get(0,'ScreenSize'));
                        fooIdx = [];
                        hflll = subplot(1,1,1); % plot logaritmic decays
                        hold on;
                        if excludePoints(nn) == 0
                           semilogy(t(fittedDecayTimePoints_indices), (lifetimes(nn,1).*exp(-fittedDecayTimePoints_us./lifetimes(nn,2))+lifetimes(nn,3)) .* summed_lifetime_data (nn,fittedDecayTimePoints_indices(1)),'k','LineWidth',2 );
                           semilogy(t,summed_lifetime_data(nn,:),'.b');
                           ltm = ['lifetime = ' sprintf('%3.1f',lifetimes(nn,2)) ' us'];
                           legendstr = {sprintf('%20s',ltm)};
                           legendstr = [legendstr sprintf('%20s','sum decays')];
                        end
                        semilogy(t,squeeze(sub_summed_lifetime_data(nn,:,:)));
                        if ~isempty(fooIdx)
                           semilogy(t,squeeze(sub_summed_lifetime_data(nn,fooIdx,:)),'k');
                        end
                        set(hflll,'YScale','log');
                        xlabel('Time (us)');
                        title(['Sub- and total decay. Removed outliers from total: ' num2str(removedOutliers(nn))]);
                        if excludePoints(nn)==0
                           legend(legendstr);
                        else
                           legend('This point is excluded');
                        end
                        print(hftmp,'temp.tif','-dtiff');
                        AAA = imread('temp.tif');
                        imwrite(AAA,fnameControl,'tiff','WriteMode','append');
                        close(hftmp);
                        % ask if some sub-decays are to be removed
                        fooIdx = find(squeeze(excludeSubGroups(nn,:))==1);
                        if isempty(fooIdx)
                           excludedSoFar = {'none'};
                        else
                           excludedSoFar = ' ';
                           for ifoo = 1:length(fooIdx)
                               excludedSoFar = [excludedSoFar ' ' num2str(fooIdx(ifoo))];
                           end
                           excludedSoFar = {excludedSoFar};
                        end
                        excludeInput{1} = 'none';
                        if ~strcmp(excludeInput{1},'none')
                           excludeInput = str2num(excludeInput{1});
                           if ~isequal(excludeInput, fooIdx)
                              flagChange = 1;
                              excludeSubGroups(nn,excludeInput)=1;
                              if isempty(find(excludeSubGroups(nn,:)==0))
                                 excludePoints(nn)=1;
                              end
                           end
                        else
                           if ~isempty(fooIdx)
                              flagChange = 1;
                              excludeSubGroups(nn,:)=0;
                              excludePoints(nn)=0;
                           end
                        end
                    end 
                    if flagChange
                       delete(fnameControl);
                    end
                    delete('temp.tif');
                    %%% close all;
                    flagDone = ~flagChange;
                    flagFirstLoop = 0; 
                 case 'No'  
                    close(surveyFig);  
                    flagDone = 1; 
             end
          end
       end    
    end
end
   
%%% Process Angiogram data
function pushbutton_AngioProcess_Callback(hObject, eventdata, handles)


%%% Show TPSF
function pushbutton_TPSF_Callback(hObject, eventdata, handles)
answer0 = questdlg('Select pO2 data to show TPSF ?', 'TPSF display option', 'Most recent','Manual selection','Most recent');
switch answer0
    case 'Most recent'   %%% Find the most recent pO2 data and process
       datapath = handles.Daq.SavePath;
       listing = dir(datapath);
       fileindex = find(contains({listing.name},'pO2_Galvo_TD'));
       if ~isempty(fileindex)
          filename = listing(fileindex(end)).name;
          filepath = [datapath filename];
       else
          h_msg = msgbox('No pO2 data found in current data folder !'); 
          return;
       end
    case 'Manual selection'    %%% Manually select pO2 data and process
       [filename,datapath] = uigetfile('E:\Data\*.mat','Select pO2 data files');
       filepath = strcat(datapath,filename); 
end   
%%% Load pO2 data for display
Temp = load(filepath);
if isfield(Temp,'CI_DataProcessed')
   %%% Preprocesing data
   PixelNumTotal = size(Temp.GalvoPara.PO2Pos,1);
   PO2DataProcessed = zeros(size(Temp.GalvoPara.PO2Pos,1),size(Temp.CI_DataProcessed,2));
   if Temp.DaqPara.DaqRepeat == 1
      PO2DataProcessed = Temp.CI_DataProcessed;
   else
      for iii = 1:Temp.DaqPara.DaqRepeat
          PO2DataProcessed = PO2DataProcessed + Temp.CI_DataProcessed((iii-1)*PixelNumTotal+1:iii*PixelNumTotal,:);
      end
   end 
   handles.Daq.TPSF_Display = PO2DataProcessed;
   handles.Daq.PO2Pos_Display = [Temp.GalvoPara.PixelX+1-Temp.GalvoPara.PO2Pos(:,1) Temp.GalvoPara.PO2Pos(:,2)];
else
   h_msg = msgbox('This is not pO2 data !');  
end
%%% Display loaded TPSF and PO2Pos at the 1st pixel
handles.CriticalDispMode = [0 0 0 1 0];
set(handles.radiobutton_TPSF,'value',1);
set(handles.text_SurveyScanColorbarMin,'Visible','Off');
set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
set(handles.text_SurveyScanColorbarMax,'Visible','Off');
set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
for i = 1: size(handles.Daq.PO2Pos_Display,1)
    s{i} = sprintf('%d, %d',[handles.Daq.PO2Pos_Display(i,1) handles.Daq.PO2Pos_Display(i,2)]);
end
set(handles.listbox_PixelSelected,'string', s);
set(handles.listbox_PixelSelected,'value', 1);
set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Daq.PO2Pos_Display,1)));

axes(handles.axes_CriticalDisplay);
semilogy(handles.Daq.TPSF_Display(1,:),'b-');
grid on
set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
%%% Save handles
guidata(hObject, handles);

%%% Set surveyscan display colorbarMax
function edit_SurveyScanColorbarMax_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_SurveyScanColorbarMax,'string'));
if val > handles.Daq.SurveyScanColorbarMin & ~isempty(handles.Daq.SurveyScanImg)  
   if handles.Daq.SurveyScanFtrStatus
      SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
   else
      SurveyScanTemp = handles.Daq.SurveyScanImg;
   end   
   handles.Daq.SurveyScanColorbarMax = val;
   handles.CriticalDispMode = [0 0 1 0 0];
   set(handles.radiobutton_SelectCh1,'value', 1);
   axes(handles.axes_CriticalDisplay);
   h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   set(h_img,'Tag','axes_CriticalDisplay');
   if ~isempty(handles.Galvo.PO2PosList)
      for i = 1: size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
      end
      set(handles.listbox_PixelSelected,'string', s);
      s_ind = get(handles.listbox_PixelSelected, 'value');
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
 
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay'); 
   end   
   h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
   set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
   set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);
else   
end
set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
%%% Save handles
guidata(hObject, handles);

%%% Set surveyscan display colorbarMin
function edit_SurveyScanColorbarMin_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_SurveyScanColorbarMin,'string'));
if val < handles.Daq.SurveyScanColorbarMax & ~isempty(handles.Daq.SurveyScanImg)
   if handles.Daq.SurveyScanFtrStatus
      SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
   else
      SurveyScanTemp = handles.Daq.SurveyScanImg;
   end    
   handles.Daq.SurveyScanColorbarMin = val;
   handles.CriticalDispMode = [0 0 1 0 0];
   set(handles.radiobutton_SelectCh1,'value', 1);
   axes(handles.axes_CriticalDisplay);
   h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   set(h_img,'Tag','axes_CriticalDisplay');
   if ~isempty(handles.Galvo.PO2PosList)
      for i = 1: size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
      end
      set(handles.listbox_PixelSelected,'string', s);
      s_ind = get(handles.listbox_PixelSelected, 'value');
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay'); 
   end  
   h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
   set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
   set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);
else    
end
set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
%%% Save handles
guidata(hObject, handles);

%%% Set Surveyscan filter status
function radiobutton_FilterSurveyscan_Callback(hObject, eventdata, handles)
handles.Daq.SurveyScanFtrStatus = get(handles.radiobutton_FilterSurveyscan,'value');
if find(handles.CriticalDispMode) == 3
   if ~isempty(handles.Daq.SurveyScanImg)
      if handles.Daq.SurveyScanFtrStatus
         SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
      else
         SurveyScanTemp = handles.Daq.SurveyScanImg;
      end    
      handles.Daq.SurveyScanColorbarMin = min(SurveyScanTemp(:));
      if max(SurveyScanTemp(:)) > min(SurveyScanTemp(:))
         handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:));
      else
         handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:))+10; 
      end
      set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
      set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
      axes(handles.axes_CriticalDisplay);
      h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
      colormap(handles.axes_CriticalDisplay,gray);
      colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
      set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
      set(h_img,'Tag','axes_CriticalDisplay');
      if ~isempty(handles.Galvo.PO2PosList)
         for i = 1: size(handles.Galvo.PO2PosList,1)
             s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
         end
         set(handles.listbox_PixelSelected,'string', s);
         s_ind = get(handles.listbox_PixelSelected, 'value');
         s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         hold on
         h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                 handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
         set(h_pts,'MarkerSize',8);
         hold off
         set(h_pts,'Tag','axes_CriticalDisplay');
         if any(handles.Daq.DaqMode == [3 4 5])
            %%% Configure DaqMode
            DaqModeConfig(hObject, eventdata, handles); 
         end
      end
      h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
      set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
      set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);
   else
   end  
else    
end
%%% Save handles
guidata(hObject, handles);

%%% Set CriticalDisplayMode
function uibuttongroup_CriticalDispMode_SelectionChangedFcn(hObject, eventdata, handles)
if handles.Daq.PhotonCntsMoniStatus == 1
   handles.CriticalDispMode = [0 1 0 0 0];
   set(handles.radiobutton_PhotonCntsMoni,'value',1);
else
   handles.CriticalDispMode(1) = get(handles.radiobutton_SelectCamera,'value');
   handles.CriticalDispMode(2) = get(handles.radiobutton_PhotonCntsMoni,'value');
   handles.CriticalDispMode(3) = get(handles.radiobutton_SelectCh1,'value');
   handles.CriticalDispMode(4) = get(handles.radiobutton_TPSF,'value');
   handles.CriticalDispMode(5) = get(handles.radiobutton_AccelerometerMoni,'value');
   
   switch find(handles.CriticalDispMode)
       %%% Camera display
       case 1 
            cla(handles.axes_CriticalDisplay);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On');
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');
       %%% Photon counts signal display
       case 2
            cla(handles.axes_CriticalDisplay);
            set(handles.text_SurveyScanColorbarMin,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
            set(handles.text_SurveyScanColorbarMax,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
            set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
       %%% Ch1 signal      
       case 3
            cla(handles.axes_CriticalDisplay);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On');
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');
            if ~isempty(handles.Daq.SurveyScanImg)
               if handles.Daq.SurveyScanFtrStatus
                  SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
               else
                  SurveyScanTemp = handles.Daq.SurveyScanImg;
               end    
               handles.Daq.SurveyScanColorbarMin = min(SurveyScanTemp(:));
               if max(SurveyScanTemp(:)) > min(SurveyScanTemp(:))
                  handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:));
               else
                  handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:))+10; 
               end
               set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
               set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
               axes(handles.axes_CriticalDisplay);
               h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
               colormap(handles.axes_CriticalDisplay,gray);
               colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
               set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
               set(h_img,'Tag','axes_CriticalDisplay');
               if ~isempty(handles.Galvo.PO2PosList)
                  for i = 1: size(handles.Galvo.PO2PosList,1)
                      s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
                  end
                  set(handles.listbox_PixelSelected,'string', s);
                  s_ind = get(handles.listbox_PixelSelected, 'value');
                  s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                  %%% Set active pO2 pixels
                  if handles.Galvo.ActivePixelStatus == 1 
                     handles.Galvo.ActivePixelStatus = 0;
                     set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
                     set(handles.listbox_PixelSelected,'max',1);
                  end
                  handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
                  set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
                  %%% Plot points
                  axes(handles.axes_CriticalDisplay);
                  hold on
                  h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                          handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                  set(h_pts,'MarkerSize',8);
                  hold off
                  set(h_pts,'Tag','axes_CriticalDisplay');
                  if any(handles.Daq.DaqMode == [3 4 5])
                     %%% Configure DaqMode
                     DaqModeConfig(hObject, eventdata, handles); 
                  end
               else
                  set(handles.listbox_PixelSelected,'string','');
                  %%% Set active pO2 pixels
                  if handles.Galvo.ActivePixelStatus == 1 
                     handles.Galvo.ActivePixelStatus = 0;
                     set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
                     set(handles.listbox_PixelSelected,'max',1); 
                  end
                  handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
                  set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
               end
            else
            end
            h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
            set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
            set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);
       %%% TPSF display     
       case 4
            cla(handles.axes_CriticalDisplay);
            set(handles.text_SurveyScanColorbarMin,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
            set(handles.text_SurveyScanColorbarMax,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
            set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
            if ~isempty(handles.Daq.PO2Pos_Display) | ~isempty(handles.Daq.TPSF_Display)
               for i = 1: size(handles.Daq.PO2Pos_Display,1)
                   s{i} = sprintf('%d, %d',[handles.Daq.PO2Pos_Display(i,1) handles.Daq.PO2Pos_Display(i,2)]);
               end
               set(handles.listbox_PixelSelected,'string', s);
               set(handles.listbox_PixelSelected,'value', 1);
               set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Daq.PO2Pos_Display,1)));

               axes(handles.axes_CriticalDisplay);
               semilogy(handles.Daq.TPSF_Display(1,:),'b-');
               grid on
               set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
            end
       %%% Accelerometer signal monitoring
       case 5
            cla(handles.axes_CriticalDisplay);
            set(handles.text_SurveyScanColorbarMin,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
            set(handles.text_SurveyScanColorbarMax,'Visible','Off');
            set(handles.edit_SurveyScanColorbarMax,'Visible','Off');
            set(handles.text_PixelInfoCriticalDisp,'Visible','Off');
    end
end
%%% Save handles
guidata(hObject, handles);

%%% Set laser output status
function radiobutton_LaserOutStatus_Callback(hObject, eventdata, handles)
val = get(handles.radiobutton_LaserOutStatus,'value');
if val == 1
   handles.Eom.LaserOutStatus = 1;
   if any(handles.Daq.DaqMode == [0 1])
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   else
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   end
else
   handles.Eom.LaserOutStatus = 0;
   DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
   DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
   DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
   DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
   DAQStopTask(handles.Eom.AO_Handle);
end
%%% Save handles
guidata(hObject, handles);

%%% Monitoring Photon Cnts
function pushbutton_PhotonCntsMoni_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   return; 
else
   if handles.Daq.PhotonCntsMoniStatus == 0
      if handles.Daq.AccelerMoniStatus == 1 
         handles.Daq.AccelerMoniStatus = 0;
         set(radiobutton_AccelerometerMoni,'value',0);
         set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         DAQStopTask(handles.Daq.AI_Handle);
      else
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
      end       
      handles.Daq.PhotonCntsMoniStatus = 1;
      set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[1 0 0]);
      %%% Configure photon counter clock
      DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_None);
      DAQSetStartTrigRetriggerable(handles.Daq.PhotonCntrSampClk_Handle, 0);
      DAQSetCOPulseFreqInitialDelay(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 2e-8);
      DAQSetCOPulseFreq(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, handles.Daq.PhotonCntsMoniRate);
      DAQSetCOPulseDutyCyc(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 0.5);
      DAQCfgImplicitTimingFiniSamps(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntsMoniSampNum);         
      %%% Configure photon counter
      DAQCfgSampClkTimingFiniSamps(handles.Daq.PhotonCntr_Handle,'/PXI1Slot3/Ctr1InternalOutput', 1e5,handles.Daq.PhotonCntsMoniSampNum);
      %%% Set timer
      if ~isempty(timerfind)
         stop(timerfind);
         delete(timerfind);
      end
      set(handles.radiobutton_PhotonCntsMoni,'value',1);
      handles.CriticalDispMode = [0 1 0 0 0];
      set(handles.text_SurveyScanColorbarMin,'Visible','Off');
      set(handles.edit_SurveyScanColorbarMin,'Visible','Off');
      set(handles.text_SurveyScanColorbarMax,'Visible','Off');
      set(handles.edit_SurveyScanColorbarMax,'Visible','Off');  
      set(handles.text_PixelInfoCriticalDisp,'Visible','Off');

      t_PhotonCnts = timer;
      t_PhotonCnts.StartDelay = 0;
      t_PhotonCnts.TimerFcn = {@PhotonCountRate, handles};
      t_PhotonCnts.ExecutionMode = 'fixedRate';
      t_PhotonCnts.Period = 1.5;
      start(t_PhotonCnts);
   else
      handles.Daq.PhotonCntsMoniStatus = 0;
      set(handles.radiobutton_PhotonCntsMoni,'value',0);
      cla(handles.axes_CriticalDisplay);
      title(handles.axes_CriticalDisplay,' ');

      handles.CriticalDispMode = [1 0 0 0 0];
      set(handles.radiobutton_SelectCamera,'value',1);
      set(handles.text_SurveyScanColorbarMin,'Visible','On');
      set(handles.edit_SurveyScanColorbarMin,'Visible','On');
      set(handles.text_SurveyScanColorbarMax,'Visible','On');
      set(handles.edit_SurveyScanColorbarMax,'Visible','On');
      set(handles.text_PixelInfoCriticalDisp,'Visible','On');
      set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
      set(handles.text_PhotonCntsMoni,'string',' ');
      if ~isempty(timerfind)
         stop(timerfind);
         delete(timerfind);
      end
      DAQStopTask(handles.Daq.PhotonCntr_Handle);
      DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
      DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_DigEdge);
   end
end
%%% Save handles
guidata(hObject, handles);

%%% PhotonCountRate Timer callback function
function varargout = PhotonCountRate(~,~, handles)
DAQStartTask(handles.Daq.PhotonCntr_Handle);
DAQStartTask(handles.Daq.PhotonCntrSampClk_Handle);

handles.Daq.PhotonCntsMoniArray = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle,handles.Daq.PhotonCntsMoniSampNum);
PhotonCnts = double(diff(handles.Daq.PhotonCntsMoniArray))*handles.Daq.PhotonCntsMoniRate;

set(handles.text_PhotonCntsMoni,'string',num2str(round(mean(PhotonCnts))));
plot(handles.axes_CriticalDisplay,PhotonCnts,'b-');
axis(handles.axes_CriticalDisplay,[1 handles.Daq.PhotonCntsMoniSampNum-1 1 max(max(PhotonCnts)*2,10)]);
set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
title(handles.axes_CriticalDisplay,'Photon count monitor');
xlabel(handles.axes_CriticalDisplay,'Data Pts', 'FontSize', 8);
ylabel(handles.axes_CriticalDisplay,'P.C. Rate (cps)','FontSize', 8);
DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
DAQStopTask(handles.Daq.PhotonCntr_Handle);

%%% Set AcqAllPhotonStatus
function radiobutton_AcqAllPhotonStatus_Callback(hObject, eventdata, handles)
if handles.Daq.DaqMode == 2
   handles.Daq.AcqAllPhotonStatus = get(handles.radiobutton_AcqAllPhotonStatus,'value');
else
   handles.Daq.AcqAllPhotonStatus = 0;
   set(handles.radiobutton_AcqAllPhotonStatus,'value',handles.Daq.AcqAllPhotonStatus); 
end
%%% Save handles
guidata(hObject, handles);

%%% CriticalDisplay_ButtonDown Function
function axes_CriticalDisplay_ButtonDownFcn(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3
   switch handles.Galvo.AddPixelMode
       case 0   %%% Not active
          return; 
       case 1   %%% Add pixels
          pos = get(gca,'CurrentPoint');
          pos = pos(1,1:2);
          pos = round(pos(1,:));
          handles.Galvo.PO2PosList(end+1,:) = [handles.Galvo.PixelX+1-pos(1) pos(2)];
          %%% Add to list 
          s = get(handles.listbox_PixelSelected, 'string');
          s{end+1} = sprintf('%d, %d',[pos(1) pos(2)]);
          set(handles.listbox_PixelSelected,'string', s);
          set(handles.listbox_PixelSelected, 'value',length(s));
          s_ind = get(handles.listbox_PixelSelected, 'value');
          %%% Plot points
          axes(handles.axes_CriticalDisplay);
          delete(findobj(gca,'type','line'));
          if ~isempty(handles.Galvo.PO2PosList)
             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
             hold on
             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
             set(h_pts,'MarkerSize',8);
             hold off
             set(h_pts,'Tag','axes_CriticalDisplay');
          end
       case 2   %%% Add ROI
          if handles.Galvo.SelectRectROI_Status == 1
             pos1 = get(handles.axes_CriticalDisplay,'currentpoint');
             pos1 = pos1(1,1:2);
             rbbox;
             pos2 = get(handles.axes_CriticalDisplay,'currentpoint');
             pos2 = pos2(1,1:2);
             hold on
             ROI_Pos = [min(pos1, pos2),abs(pos1-pos2)];
             rectangle('Position',ROI_Pos,'EdgeColor','m', 'LineWidth',0.5);
             hold off
             %%% Find best ROI spacing
             RectROIFlag = 1;
             while RectROIFlag
                %%% Input Rect ROI spacing
                prompt = {'Points X spacing (px):','Points Y spacing (px):'};
                dlgtitle = 'Rectangular ROI';
                dims = [1 35];
                answerinput = inputdlg(prompt,dlgtitle,dims);
                if ~isempty(cell2mat(answerinput)) & length(cell2mat(answerinput))==2
                   answerinput = str2num(cell2mat(answerinput));
                   PointXSpacing = round(answerinput(1));
                   PointYSpacing = round(answerinput(2));
                   if PointXSpacing < 1
                      PointXSpacing = 1;
                   elseif PointXSpacing > abs(pos1(1)-pos2(1))
                      PointXSpacing = abs(pos1(1)-pos2(1));
                   else  
                   end
                   if PointYSpacing < 1
                      PointYSpacing = 1;
                   elseif PointYSpacing > abs(pos1(2)-pos2(2))
                      PointYSpacing = abs(pos1(2)-pos2(2));
                   else   
                   end
                   [ROI_X ROI_Y] = meshgrid(ceil(min(pos1(1),pos2(1))):PointXSpacing:floor(max(pos1(1),pos2(1))), ceil(min(pos1(2),pos2(2))):PointYSpacing:floor(max(pos1(2),pos2(2))));
                   ROI_X = ROI_X(:);
                   ROI_Y = ROI_Y(:);
                   for i = 1:length(ROI_X)        
                       axes(handles.axes_CriticalDisplay);
                       delete(findobj(gca,'type','line'));
                       delete(findobj(gca,'type','rectangle'));
                       hold on
                       plot(ROI_X, ROI_Y,'r.','MarkerSize',7);
                       hold off
                   end
                   questtitle = sprintf('Are you happy with the ROI?');
                   quest_ans = questdlg(questtitle,'Rectangular ROI','Yes','No','Cancel','No');
                   switch quest_ans
                       case 'Yes'
                          RectROIFlag = 0;
                          %%% Add points to list
                          s = get(handles.listbox_PixelSelected, 'string');
                          for i = 1:length(ROI_X)
                              if isempty(find(ismember(s, sprintf('%d, %d',[ROI_X(i) ROI_Y(i)]))))
                                 handles.Galvo.PO2PosList(end+1,:) = [handles.Galvo.PixelX+1-ROI_X(i) ROI_Y(i)];           
                                 s{end+1} = sprintf('%d, %d',[ROI_X(i) ROI_Y(i)]);
                                 set(handles.listbox_PixelSelected, 'string',s);
                              else
                              end
                          end
                          set(handles.listbox_PixelSelected, 'value',length(s));
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','rectangle'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                       case 'No'
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','rectangle'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                       case 'Cancel'  
                          RectROIFlag = 0;
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','rectangle'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                   end
                else
                   RectROIFlag = 0; 
                   s_ind = get(handles.listbox_PixelSelected, 'value');
                   %%% Plot points
                   axes(handles.axes_CriticalDisplay);
                   delete(findobj(gca,'type','line'));
                   delete(findobj(gca,'type','rectangle'));
                   if ~isempty(handles.Galvo.PO2PosList)
                      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                      hold on
                      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                      set(h_pts,'MarkerSize',8);
                      hold off
                      set(h_pts,'Tag','axes_CriticalDisplay');
                   end
                end
             end
          else   %%% handles.Galvo.SelectCircROI_Status == 1
             pos1 = get(handles.axes_CriticalDisplay,'currentpoint');
             pos1 = pos1(1,1:2);
             MaxRadPixel = min([pos1(1), handles.Galvo.PixelX+1-pos1(1), pos1(2), handles.Galvo.PixelY+1-pos1(2)])-1;
             MaxRadDis = MaxRadPixel*handles.Galvo.FOV/handles.Galvo.PixelX; %%% unit: um
             RadDisPlotStep = 20; %%% unit: um
             RadDisPlotTemp = (20:RadDisPlotStep:MaxRadDis)';
             if ~isempty(RadDisPlotTemp)
                hold on
                viscircles(handles.axes_CriticalDisplay,[pos1(1)*ones(length(RadDisPlotTemp),1) pos1(2)*ones(length(RadDisPlotTemp),1)],RadDisPlotTemp/handles.Galvo.FOV*handles.Galvo.PixelX,'Color','m','LineStyle','--','LineWidth',2);
                hold off
             end
             %%% Find best ROI parameters
             CircROIFlag = 1;
             while CircROIFlag
                %%% Input Circ ROI parameters
                prompt = {'Radius/Radii (\mum): ','Num of pixels per circle: '};
                dlgtitle = 'Circular ROI';
                dims = [1 35];
                answerinput = inputdlg(prompt,dlgtitle,dims);
                if length(answerinput)==2 & ~isempty(str2num(answerinput{1})) & ~isempty(str2num(answerinput{2}))
                   RadDisArray = str2num(answerinput{1});
                   PxNumPerCirTemp = round(str2num(answerinput{2}));
                   if length(PxNumPerCirTemp) < length(RadDisArray)
                      PxNumPerCirArray = PxNumPerCirTemp(1)*ones(size(RadDisArray));
                   else
                      PxNumPerCirArray = PxNumPerCirTemp;
                   end
                   PxNumPerCirArray = max(2, PxNumPerCirArray);
                   RadPixelArray = RadDisArray/handles.Galvo.FOV*handles.Galvo.PixelX;
                   ROI_X = [];
                   ROI_Y = [];
                   ROI_X = [ROI_X; pos1(1)];
                   ROI_Y = [ROI_Y; pos1(2)];
                   for i = 1:length(RadPixelArray)
                       ThetaTemp0 = linspace(0,2*pi,PxNumPerCirArray(i)+1);
                       ThetaTemp1 = ThetaTemp0(1:PxNumPerCirArray(i))';
                       ROI_X = [ROI_X; pos1(1)+RadPixelArray(i)*cos(ThetaTemp1)];
                       ROI_Y = [ROI_Y; pos1(2)+RadPixelArray(i)*sin(ThetaTemp1)];
                   end
                   IndIgnore = union(find(ROI_X < 0 | ROI_X > handles.Galvo.PixelX),find(ROI_Y < 0 | ROI_Y > handles.Galvo.PixelY));
                   ROI_X(IndIgnore) = [];
                   ROI_Y(IndIgnore) = [];
                   for i = 1:length(ROI_X)        
                       axes(handles.axes_CriticalDisplay);
                       delete(findobj(gca,'type','line'));
                       delete(findobj(gca,'type','group'));
                       hold on
                       plot(ROI_X, ROI_Y,'r.','MarkerSize',7);
                       hold off
                   end
                   questtitle = sprintf('Are you happy with the ROI?');
                   quest_ans = questdlg(questtitle,'Circular ROI','Yes','No','Cancel','No');
                   switch quest_ans
                       case 'Yes'
                          CircROIFlag = 0;
                          %%% Add points to list
                          s = get(handles.listbox_PixelSelected, 'string');
                          for i = 1:length(ROI_X)
                              if isempty(find(ismember(s, sprintf('%d, %d',[ROI_X(i) ROI_Y(i)]))))
                                 handles.Galvo.PO2PosList(end+1,:) = [handles.Galvo.PixelX+1-ROI_X(i) ROI_Y(i)];           
                                 s{end+1} = sprintf('%d, %d',[ROI_X(i) ROI_Y(i)]);
                                 set(handles.listbox_PixelSelected, 'string',s);
                              else
                              end
                          end
                          set(handles.listbox_PixelSelected, 'value',length(s));
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','group'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                       case 'No'
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','group'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                       case 'Cancel'  
                          CircROIFlag = 0;
                          s_ind = get(handles.listbox_PixelSelected, 'value');
                          %%% Plot points
                          axes(handles.axes_CriticalDisplay);
                          delete(findobj(gca,'type','line'));
                          delete(findobj(gca,'type','group'));
                          if ~isempty(handles.Galvo.PO2PosList)
                             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                             hold on
                             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                             set(h_pts,'MarkerSize',8);
                             hold off
                             set(h_pts,'Tag','axes_CriticalDisplay');
                          end
                   end
                else
                   CircROIFlag = 0; 
                   s_ind = get(handles.listbox_PixelSelected, 'value');
                   %%% Plot points
                   axes(handles.axes_CriticalDisplay);
                   delete(findobj(gca,'type','line'));
                   delete(findobj(gca,'type','group'));
                   if ~isempty(handles.Galvo.PO2PosList)
                      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                      hold on
                      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                      set(h_pts,'MarkerSize',8);
                      hold off
                      set(h_pts,'Tag','axes_CriticalDisplay');
                   end
                end
             end  
          end
       case 3   %%% Modify current pixel
          if ~isempty(handles.Galvo.PO2PosList)
             pos = get(gca,'CurrentPoint');
             pos = pos(1,1:2);
             dis = sqrt((handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1)-pos(1)).^2 + (handles.Galvo.PO2PosList(:,2)-pos(2)).^2);
             s_ind = find(dis == min(dis),1,'first');
             set(handles.listbox_PixelSelected, 'value',s_ind);
             %%% Plot points
             axes(handles.axes_CriticalDisplay);
             delete(findobj(gca,'type','line'));
             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
             hold on
             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
             hold off
             set(h_pts,'MarkerSize',8);
             set(h_pts,'Tag','axes_CriticalDisplay');
          end
   end
   %%% Active pO2 pixels 
   handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;
   set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
   if any(handles.Daq.DaqMode == [3 4 5]) 
      %%% Configure DaqMode
      DaqModeConfig(hObject, eventdata, handles); 
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Add pixel 
function pushbutton_AddPixel_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3
   if handles.Galvo.AddPixelStatus == 0
      handles.Galvo.AddPixelStatus = 1;
      %%% Set display
      set(handles.pushbutton_AddPixel,'BackgroundColor',[1 0 0]);
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);     
      if handles.Galvo.SelectRectROI_Status == 1 | handles.Galvo.SelectCircROI_Status == 1
         handles.Galvo.AddPixelMode = 2;
      else
         handles.Galvo.AddPixelMode = 1;
      end
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
      %%% Update list display
      s = get(handles.listbox_PixelSelected, 'string');
      set(handles.listbox_PixelSelected, 'value',length(s));  
      s_ind = get(handles.listbox_PixelSelected, 'value');
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      if ~isempty(handles.Galvo.PO2PosList)
         s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
         hold on
         h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                 handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
         hold off
         set(h_pts,'MarkerSize',8);
         set(h_pts,'Tag','axes_CriticalDisplay');
            
         h_zoom = zoom;
         h_zoom.Enable = 'on';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown); 
      end
   else
      handles.Galvo.AddPixelStatus = 0;
      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      handles.Galvo.AddPixelMode = 0;
      s_ind = get(handles.listbox_PixelSelected, 'value');
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      if ~isempty(handles.Galvo.PO2PosList)
         s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
         hold on
         h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                    handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
         hold off
         set(h_pts,'MarkerSize',8);
         set(h_pts,'Tag','axes_CriticalDisplay'); 
            
         h_zoom = zoom;
         h_zoom.Enable = 'off';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown); 
      end   
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Select Rectangular ROI
function pushbutton_SelectRectROI_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3
   if handles.Galvo.SelectRectROI_Status == 1
      handles.Galvo.SelectRectROI_Status = 0;
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      if handles.Galvo.AddPixelStatus == 1
         handles.Galvo.AddPixelMode = 1;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                  handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'on';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);  
      else
         handles.Galvo.AddPixelMode = 0;
         axes(handles.axes_CriticalDisplay);
         h_zoom = zoom;
         h_zoom.Enable = 'off';
      end
   elseif handles.Galvo.SelectRectROI_Status == 0 & handles.Galvo.SelectCircROI_Status == 0 
      handles.Galvo.SelectRectROI_Status = 1; 
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[1 0 0]);
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
      if handles.Galvo.AddPixelStatus == 1
         handles.Galvo.AddPixelMode = 2;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                    handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'on';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);  
      else
         if handles.Galvo.AddPixelMode == 8
            set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);
         end
         handles.Galvo.AddPixelMode = 0;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         set(handles.pushbutton_SelectRectROI,'BackgroundColor',[1 0 0]);
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                    handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'off';
      end
   else     
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Select Circular ROI
function pushbutton_SelectCircROI_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3
   if handles.Galvo.SelectCircROI_Status == 1
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      if handles.Galvo.AddPixelStatus == 1
         handles.Galvo.AddPixelMode = 1;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                  handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'on';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);  
      else
         handles.Galvo.AddPixelMode = 0;
         axes(handles.axes_CriticalDisplay);
         h_zoom = zoom;
         h_zoom.Enable = 'off';
      end
   elseif handles.Galvo.SelectCircROI_Status == 0 & handles.Galvo.SelectRectROI_Status == 0  
      handles.Galvo.SelectCircROI_Status = 1; 
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[1 0 0]);
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
      if handles.Galvo.AddPixelStatus == 1
         handles.Galvo.AddPixelMode = 2;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                    handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'on';
         h_zoom.ButtonDownFilter = 'true';
         h_buttondown='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown);  
      else
         if handles.Galvo.AddPixelMode == 8
            set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);
         end
         handles.Galvo.AddPixelMode = 0;
         s_ind = get(handles.listbox_PixelSelected, 'value');
         set(handles.pushbutton_SelectCircROI,'BackgroundColor',[1 0 0]);
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         delete(findobj(gca,'type','line'));
         if ~isempty(handles.Galvo.PO2PosList)
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                    handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            hold off
            set(h_pts,'MarkerSize',8);
            set(h_pts,'Tag','axes_CriticalDisplay');
         end
         h_zoom = zoom;
         h_zoom.Enable = 'off';
      end
   else     
   end
end
%%% Save handles
guidata(hObject, handles);

%%% DeletePixel
function pushbutton_DeletePixel_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0 & handles.Galvo.AddPixelMode ~= 8  
   s_ind = get(handles.listbox_PixelSelected, 'value');
   answer_delete = questdlg('Do you want to delete the selected pO2 pixel ?', 'pO2 pixel delete', 'Yes','No','No');
   switch answer_delete
       case 'Yes'
          %%% Delete pO2 pixel
          s = get(handles.listbox_PixelSelected, 'string');
          s(s_ind,:) = [];
          set(handles.listbox_PixelSelected, 'value',length(s));
          set(handles.listbox_PixelSelected, 'string',s);
          handles.Galvo.PO2PosList(s_ind,:) = [];
          s_ind_update = get(handles.listbox_PixelSelected, 'value');
          %%% Plot points
          axes(handles.axes_CriticalDisplay);
          delete(findobj(gca,'type','line'));
          delete(findobj(gca,'type','rectangle'));
          if ~isempty(handles.Galvo.PO2PosList)
             s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind_update);
             hold on
             h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                     handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind_update,1), handles.Galvo.PO2PosList(s_ind_update,2),'g.');
             hold off
             set(h_pts,'MarkerSize',8);
             set(h_pts,'Tag','axes_CriticalDisplay'); 
          end
          handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
          set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
          if any(handles.Daq.DaqMode == [3:5])
             %%% Configure DaqMode
             DaqModeConfig(hObject, eventdata, handles); 
          end
       case 'No'
          return;
   end
else
   return; 
end
%%% Save handles
guidata(hObject, handles);

%%% Modify Pixel
function pushbutton_ModifyPixel_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList)
   if handles.Galvo.AddPixelMode == 3 | handles.Galvo.AddPixelMode == 5 | handles.Galvo.AddPixelMode == 7
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      handles.Galvo.AddPixelMode = 0;  %%%  Not active
      handles.Galvo.AddPixelStatus = 0;
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);   
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);   
      s_ind = get(handles.listbox_PixelSelected, 'value');
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
   else   %%% Enable modifying pixels positions  
      handles.Galvo.AddPixelMode = 3;  %%%  Modify current pixel
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[1 0 0]);
      handles.Galvo.AddPixelStatus = 0;
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end 
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
          
      s_ind = size(handles.Galvo.PO2PosList,1);
      set(handles.listbox_PixelSelected, 'value',s_ind);
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay'); 
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Set Pan Move for all pixels
function pushbutton_PanMove_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList)
   if handles.Galvo.AddPixelMode ~= 8
      handles.Galvo.AddPixelMode = 8;  %%%  Pan move pixels
      set(handles.pushbutton_PanMove,'BackgroundColor',[1 0 0]);
      handles.Galvo.AddPixelStatus = 0;
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      %%% Set active pO2 pixels
      if handles.Galvo.ActivePixelStatus == 1
         handles.Galvo.ActivePixelStatus = 0;
         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
         set(handles.listbox_PixelSelected,'max',1); 
      end
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
         
      s_ind = size(handles.Galvo.PO2PosList,1);
      set(handles.listbox_PixelSelected, 'value',s_ind);
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1), handles.Galvo.PO2PosList(:,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
   else   %%% Disable PanMove
      set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);
      handles.Galvo.AddPixelMode = 0;  %%%  Not active
      handles.Galvo.AddPixelStatus = 0;
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;
      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      s_ind = get(handles.listbox_PixelSelected, 'value');
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% ClearPixel
function pushbutton_ClearPixel_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0
   answer_clear = questdlg('Do you want to clear all pixel selection ?', 'pO2 pixel selection clear', 'Yes','No','No');
   switch answer_clear
       case 'Yes'
          handles.Galvo.PO2PosList = [];
          set(handles.listbox_PixelSelected,'string','');
          set(handles.listbox_PixelSelected,'value',1);
          %%% Update point plot
          axes(handles.axes_CriticalDisplay);
          delete(findobj(gca,'type','line'));
          delete(findobj(gca,'type','rectangle'));
          %%% Set active pO2 pixels
          handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
          set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
          if any(handles.Daq.DaqMode == [3:5])
             %%% Configure DaqMode
             DaqModeConfig(hObject, eventdata, handles); 
          end
       case 'No'
          return;
   end 
else
   return; 
end
%%% Save handles
guidata(hObject, handles);  
   
%%% Enter active pixel mode (select multiple pixels on the list as active pixels)
function pushbutton_ActivePixel_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3
   if handles.Galvo.ActivePixelStatus == 0
      handles.Galvo.ActivePixelStatus = 1; 
      set(handles.pushbutton_ActivePixel,'BackgroundColor',[1 0 0]);
      set(handles.listbox_PixelSelected,'max',400);
      s_ind = get(handles.listbox_PixelSelected, 'value');
      if ~isempty(handles.Galvo.PO2PosList)
         handles.Galvo.PO2Pos = handles.Galvo.PO2PosList(s_ind,:); 
         handles.Eom.ActivePixelInd = ismember(handles.Galvo.PO2PosList,handles.Galvo.PO2Pos,'rows');
         handles.Galvo.ActivePixelInd = handles.Eom.ActivePixelInd;
      end
      %%% Set display 
      handles.Galvo.AddPixelMode = 0;  %%% Inactive mode
      handles.Galvo.AddPixelStatus = 0; %%% Inactive mode
      handles.Galvo.SelectRectROI_Status = 0;
      handles.Galvo.SelectCircROI_Status = 0;

      set(handles.pushbutton_AddPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectRectROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_SelectCircROI,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_ModifyPixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);       
   else
      handles.Galvo.ActivePixelStatus = 0; 
      set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
      set(handles.listbox_PixelSelected,'max',1); 
      s = get(handles.listbox_PixelSelected, 'string');
      set(handles.listbox_PixelSelected, 'value',length(s));
      s_ind = get(handles.listbox_PixelSelected, 'value');
      if ~isempty(handles.Galvo.PO2PosList)
         handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;
         handles.Eom.ActivePixelInd = logical(zeros(size(handles.Galvo.PO2PosList,1),1));
         handles.Galvo.ActivePixelInd = handles.Eom.ActivePixelInd;
         s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
         hold on
         h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                 handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
         set(h_pts,'MarkerSize',8);
         hold off
         set(h_pts,'Tag','axes_CriticalDisplay');
      end
   end
end
%%% Active pO2 pixels 
set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
if any(handles.Daq.DaqMode == [3:5])
   %%% Configure DaqMode
   DaqModeConfig(hObject, eventdata, handles);
end
%%% Save handles
guidata(hObject, handles);

%%% Move Pixel Up
function pushbutton_PixelUp_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0
   if handles.Galvo.AddPixelMode == 3  %%%  Modify current pixel
      s_ind = get(handles.listbox_PixelSelected, 'value');
      handles.Galvo.PO2PosList(s_ind,2) = max(handles.Galvo.PO2PosList(s_ind,2)-1, 1);
      s = get(handles.listbox_PixelSelected, 'string');
      s{s_ind} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1) handles.Galvo.PO2PosList(s_ind,2)]);
      set(handles.listbox_PixelSelected,'string', s);
      
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca, 'type', 'line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   elseif handles.Galvo.AddPixelMode == 8   %%%  Pan move pixels 
      handles.Galvo.PO2PosList(:,2) = max(handles.Galvo.PO2PosList(:,2)-1, 1);
      s = get(handles.listbox_PixelSelected, 'string');
      for i = 1:size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
      end
      set(handles.listbox_PixelSelected,'string', s); 
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1), handles.Galvo.PO2PosList(:,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   else
      return;
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Move Pixel Down
function pushbutton_PixelDown_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0
   if handles.Galvo.AddPixelMode == 3  %%%  Modify current pixel
      s_ind = get(handles.listbox_PixelSelected, 'value');
      handles.Galvo.PO2PosList(s_ind,2) = min(handles.Galvo.PO2PosList(s_ind,2)+1, handles.Galvo.PixelY);
      s = get(handles.listbox_PixelSelected, 'string');
      s{s_ind} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1) handles.Galvo.PO2PosList(s_ind,2)]);
      set(handles.listbox_PixelSelected,'string', s);
      
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   elseif handles.Galvo.AddPixelMode == 8   %%%  Pan move pixels 
      handles.Galvo.PO2PosList(:,2) = min(handles.Galvo.PO2PosList(:,2)+1, handles.Galvo.PixelY);
      s = get(handles.listbox_PixelSelected, 'string');
      for i = 1:size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
      end
      set(handles.listbox_PixelSelected,'string', s); 
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1), handles.Galvo.PO2PosList(:,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   else
      return;
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Move Pixel Right (Move right in GUI means move left in real space)
function pushbutton_PixelRight_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0
   if handles.Galvo.AddPixelMode == 3  %%%  Modify current pixel
      s_ind = get(handles.listbox_PixelSelected, 'value');
      handles.Galvo.PO2PosList(s_ind,1) = handles.Galvo.PixelX+1-min(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1)+1, handles.Galvo.PixelX);
      s = get(handles.listbox_PixelSelected, 'string');
      s{s_ind} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1) handles.Galvo.PO2PosList(s_ind,2)]);
      set(handles.listbox_PixelSelected,'string', s);

      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles);
      end
   elseif handles.Galvo.AddPixelMode == 8   %%%  Pan move pixels 
      handles.Galvo.PO2PosList(:,1) = handles.Galvo.PixelX+1-min(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1)+1, handles.Galvo.PixelX);
      s = get(handles.listbox_PixelSelected, 'string');
      for i = 1:size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
      end
      set(handles.listbox_PixelSelected,'string', s); 
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1), handles.Galvo.PO2PosList(:,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   else
      return;
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Move Pixel Left (Move left in GUI means move right in real space)
function pushbutton_PixelLeft_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList) & handles.Galvo.ActivePixelStatus == 0 
   if handles.Galvo.AddPixelMode == 3  %%%  Modify current pixel
      s_ind = get(handles.listbox_PixelSelected, 'value');
      handles.Galvo.PO2PosList(s_ind,1) = handles.Galvo.PixelX+1-max(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1)-1, 1);  
      s = get(handles.listbox_PixelSelected, 'string');
      s{s_ind} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1) handles.Galvo.PO2PosList(s_ind,2)]);
      set(handles.listbox_PixelSelected,'string', s);
      
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;
      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
      %%% Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   elseif handles.Galvo.AddPixelMode == 8   %%%  Pan move pixels 
      handles.Galvo.PO2PosList(:,1) = handles.Galvo.PixelX+1-max(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1)-1, 1);
      s = get(handles.listbox_PixelSelected, 'string');
      for i = 1:size(handles.Galvo.PO2PosList,1)
          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
      end
      set(handles.listbox_PixelSelected,'string', s); 
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
      %%%  Plot points
      axes(handles.axes_CriticalDisplay);
      delete(findobj(gca,'type','line'));
      delete(findobj(gca,'type','rectangle'));
      hold on
      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(:,1), handles.Galvo.PO2PosList(:,2),'g.');
      hold off
      set(h_pts,'MarkerSize',8);
      set(h_pts,'Tag','axes_CriticalDisplay');

      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   else
      return;
   end
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Pixel Selected in listbox
function listbox_PixelSelected_Callback(hObject, eventdata, handles)
if find(handles.CriticalDispMode) == 3 & ~isempty(handles.Galvo.PO2PosList)  %%% Surveyscan display
   %%% Modify AddPixelMode for PanMove Mode
   if handles.Galvo.AddPixelMode == 8
      set(handles.pushbutton_PanMove,'BackgroundColor',[0.94 0.94 0.94]);
      handles.Galvo.AddPixelMode = 0;
   end  
   %%% Get selected pixels
   s_ind = get(handles.listbox_PixelSelected, 'value');
   s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
   %%% Set active pO2 pixels 
   if handles.Galvo.ActivePixelStatus == 0
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;
      handles.Eom.ActivePixelInd = logical(zeros(size(handles.Galvo.PO2PosList,1),1));
      handles.Galvo.ActivePixelInd = handles.Eom.ActivePixelInd;
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   else
      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList(s_ind,:); 
      handles.Eom.ActivePixelInd = ismember(handles.Galvo.PO2PosList,handles.Galvo.PO2Pos,'rows');
      handles.Galvo.ActivePixelInd = handles.Eom.ActivePixelInd;
      if any(handles.Daq.DaqMode == [3:5])
         %%% Configure DaqMode
         DaqModeConfig(hObject, eventdata, handles); 
      end
   end
   set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
   %%% Plot points
   axes(handles.axes_CriticalDisplay);
   delete(findobj(gca,'type','line'));
   delete(findobj(gca,'type','rectangle'));
   hold on
   h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
           handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
   hold off
   set(h_pts,'MarkerSize',8);
   set(h_pts,'Tag','axes_CriticalDisplay');    
elseif find(handles.CriticalDispMode) == 4 & ~isempty(handles.Daq.TPSF_Display) & ~isempty(handles.Daq.PO2Pos_Display) %%% Plot TPSF
   s_ind = get(handles.listbox_PixelSelected, 'value');
   axes(handles.axes_CriticalDisplay); 
   semilogy(handles.Daq.TPSF_Display(s_ind,:),'b-');
   grid on
   set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.25 0 0.72 1.07], 'Position',[0.32 0.11 0.56 0.84]);
else
   return;
end
%%% Save handles
guidata(hObject, handles);

%%% Update pO2Pts Num
function edit_pO2PtsNum_Callback(hObject, eventdata, handles)
set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));

%%% Load Pixel Pos
function pushbutton_LoadPixelPos_Callback(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [2 3])
   answer0 = questdlg('Select data to load pixel position ?', 'Pixel position load option', 'Most recent','Manual selection','Cancel','Cancel');
   switch answer0
       case 'Most recent'   %%% Find the most recent pO2 data and process
          datapath = handles.Daq.SavePath;
          listing = dir(datapath);
          fileindex = find(contains({listing.name},'pO2_Galvo_TD'));
          if ~isempty(fileindex)
             filename = listing(fileindex(end)).name;
             %%% filepath = [datapath filename];
          else
             h_msg = msgbox('No pO2 data found in current data folder !'); 
             return;
          end
       case 'Manual selection'    %%% Manually select pO2 data and process
          [filename,datapath] = uigetfile('E:\Data\*.mat','Select pO2 data files');
          %%% filepath = strcat(datapath,filename); 
       case 'Cancel'
          return; 
   end   
   %%% Load pO2 data for display
   if filename ~= 0
      filepath = strcat(datapath,filename);
      Temp = load(filepath);
      if isfield(Temp,'GalvoPara')
         if handles.Galvo.PixelX == Temp.GalvoPara.PixelX & handles.Galvo.PixelY == Temp.GalvoPara.PixelY & ~isempty(Temp.GalvoPara.PO2PosList)
            %%% if handles.Galvo.PixelX == Temp.GalvoPara.PixelX & handles.Galvo.PixelY == Temp.GalvoPara.PixelY & ...
            %%% handles.Galvo.VoltRangeX == Temp.GalvoPara.VoltRangeX & handles.Galvo.VoltRangeY == Temp.GalvoPara.VoltRangeY & ~isempty(Temp.GalvoPara.PO2PosList)
            %%% Display pO2 pixel position and update Galvo waveform
            answer_load = questdlg('Do you want to update pixel selection ?', 'Pixel selection update', 'Surveyscan and pixel selection','Pixel selection only','No','No');
            switch answer_load
                case 'Surveyscan and pixel selection'
                   handles.Galvo.PO2PosList = Temp.GalvoPara.PO2PosList;
                   handles.Daq.SurveyScanImg = Temp.DaqPara.SurveyScanImg; 
                   if ~isempty(handles.Galvo.PO2PosList)
                      for i = 1:size(handles.Galvo.PO2PosList,1)
                          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
                      end 
                      s_ind = size(handles.Galvo.PO2PosList,1);
                      set(handles.listbox_PixelSelected, 'string',s);
                      set(handles.listbox_PixelSelected, 'value',s_ind);
                      %%% Display surveyscan 
                      handles.CriticalDispMode = [0 0 1 0 0];
                      set(handles.radiobutton_SelectCh1,'value', 1);
                      set(handles.text_SurveyScanColorbarMin,'Visible','On');
                      set(handles.edit_SurveyScanColorbarMin,'Visible','On');
                      set(handles.text_SurveyScanColorbarMax,'Visible','On');
                      set(handles.edit_SurveyScanColorbarMax,'Visible','On');
                      set(handles.text_PixelInfoCriticalDisp,'Visible','On');
                      axes(handles.axes_CriticalDisplay);
                      if handles.Daq.SurveyScanFtrStatus
                         SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
                      else
                         SurveyScanTemp = handles.Daq.SurveyScanImg;
                      end
                      handles.Daq.SurveyScanColorbarMin = min(SurveyScanTemp(:));
                      if max(SurveyScanTemp(:)) > min(SurveyScanTemp(:))
                         handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:));
                      else
                         handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:))+10; 
                      end
                      set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
                      set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
                      h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
                      colormap(handles.axes_CriticalDisplay,gray);
                      colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
                      set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
                      set(h_img,'Tag','axes_CriticalDisplay');
                      %%% Display pO2Pos
                      axes(handles.axes_CriticalDisplay);
                      delete(findobj(gca,'type','line'));
                      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                      hold on
                      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                      hold off
                      set(h_pts,'MarkerSize',8);
                      set(h_pts,'Tag','axes_CriticalDisplay');
                      %%% Set active pO2 pixels
                      if handles.Galvo.ActivePixelStatus == 1
                         handles.Galvo.ActivePixelStatus = 0;
                         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
                         set(handles.listbox_PixelSelected,'max',1); 
                      end
                      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
                      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
                      if any(handles.Daq.DaqMode == [3:5])
                         %%% Configure DaqMode
                         DaqModeConfig(hObject, eventdata, handles); 
                      end
                   else
                      h_msg = msgbox('No pixel position found in the selected data !'); 
                      return;
                   end
                case 'Pixel selection only'
                   handles.Galvo.PO2PosList = Temp.GalvoPara.PO2PosList;
                   if ~isempty(handles.Galvo.PO2PosList)
                      for i = 1:size(handles.Galvo.PO2PosList,1)
                          s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i,1) handles.Galvo.PO2PosList(i,2)]);
                      end 
                      s_ind = size(handles.Galvo.PO2PosList,1);
                      set(handles.listbox_PixelSelected, 'string',s);
                      set(handles.listbox_PixelSelected, 'value',s_ind);
                      %%% Display surveyscan 
                      handles.CriticalDispMode = [0 0 1 0 0];
                      set(handles.radiobutton_SelectCh1,'value', 1);
                      %%% Display pO2Pos
                      axes(handles.axes_CriticalDisplay);
                      delete(findobj(gca,'type','line'));
                      s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
                      hold on
                      h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                              handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
                      hold off
                      set(h_pts,'MarkerSize',8);
                      set(h_pts,'Tag','axes_CriticalDisplay');
                      %%% Set active pO2 pixels
                      if handles.Galvo.ActivePixelStatus == 1
                         handles.Galvo.ActivePixelStatus = 0;
                         set(handles.pushbutton_ActivePixel,'BackgroundColor',[0.94 0.94 0.94]);
                         set(handles.listbox_PixelSelected,'max',1); 
                      end
                      handles.Galvo.PO2Pos = handles.Galvo.PO2PosList;  
                      set(handles.edit_pO2PtsNum,'string',num2str(size(handles.Galvo.PO2Pos,1)));
                      if any(handles.Daq.DaqMode == [3:5])
                         %%% Configure DaqMode
                         DaqModeConfig(hObject, eventdata, handles); 
                      end
                   else
                      h_msg = msgbox('No pixel position found in the selected data !'); 
                      return;
                   end
                case 'No'
                   return;
            end
         else
            h_msg = msgbox('This is not the correct pO2 data !');  
            return;
         end
      else
         h_msg = msgbox('This is not the correct pO2 data !');   
         return;
      end   
   else
      return; 
   end 
end
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Camera Parameters
%%% Exit or Init Camera
function pushbutton_ExitCam_Callback(hObject, eventdata, handles)
if handles.Camera.UsageStatus
   %%% Exit Camera
   if handles.Camera.StreamStatus
      stop(timerfind);
      delete(timerfind);
      stoppreview(handles.Camera.BaslerVid);
      cla(handles.axes_CriticalDisplay);
      colorbar('off');
      handles.Camera.StreamStatus = 0;
      set(handles.pushbutton_Stream,'BackgroundColor',[0.94 0.94 0.94]); 
   end
   handles.Camera.Close();
   DispSystStatus(handles, 'Basler camera is closed !');
else
   %%% Init Camera
   handles.Camera.Init();
   DispSystStatus(handles, 'Basler camera Init Done !');
end
UpdateCameraStatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Set BitDepth
function popupmenu_BitDepth_Callback(hObject, eventdata, handles)
if find(ismember(handles.Camera.BitDepthOption,handles.Camera.BitDepth)) ~= get(handles.popupmenu_BitDepth,'value')
   delete(handles.Camera.BaslerVid);
   handles.Camera.BitDepth = handles.Camera.BitDepthOption{get(handles.popupmenu_BitDepth,'value')};
   handles.Camera.Init();
   %%%%%%%%%%%%%%%%%%%%%%%  Initialize GUI display again
   set(handles.edit_SequenceFrameNum,'string',num2str(handles.Camera.BaslerVid.FramesPerTrigger));
   set(handles.radiobutton_AutoExposure,'value',0);
   set(handles.radiobutton_AutoGain,'value',0);
   set(handles.radiobutton_CameraTrigger,'value',0);
   set(handles.popupmenu_X_Binning,'value',1);
   set(handles.popupmenu_Y_Binning,'value',1);
   set(handles.edit_CameraSavePath,'string',handles.Camera.SavePath);

   set(handles.edit_ExposureTime,'string',num2str(handles.Camera.BaslerSrc.ExposureTime));
   set(handles.slider_ExposureTime,'max',1e6);
   set(handles.slider_ExposureTime,'min',59);
   set(handles.slider_ExposureTime,'value',handles.Camera.BaslerSrc.ExposureTime);

   set(handles.edit_FrameRate,'string',num2str(handles.Camera.BaslerSrc.ResultingFrameRate));
   set(handles.slider_FrameRate,'max',handles.Camera.BaslerSrc.ResultingFrameRate);
   set(handles.slider_FrameRate,'min',2e-3);
   set(handles.slider_FrameRate,'value',handles.Camera.BaslerSrc.ResultingFrameRate);

   set(handles.edit_BlackLevel,'string',num2str(handles.Camera.BaslerSrc.BlackLevel));
   if strcmp(handles.Camera.BitDepth,'Mono8')
      set(handles.slider_BlackLevel,'max',63.75);      
   else
      set(handles.slider_BlackLevel,'max',255);
   end
   set(handles.slider_BlackLevel,'min',0);
   set(handles.slider_BlackLevel,'value',handles.Camera.BaslerSrc.BlackLevel);

   set(handles.edit_Gain,'string',num2str(handles.Camera.BaslerSrc.Gain));
   set(handles.slider_Gain,'max',12);
   set(handles.slider_Gain,'min',0);
   set(handles.slider_Gain,'value',handles.Camera.BaslerSrc.Gain);
else
    
end
%%% Save handles
guidata(hObject, handles);

%%% Set AutoExposure
function radiobutton_AutoExposure_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = get(handles.radiobutton_AutoExposure,'value');
   switch val
       case 0
          handles.Camera.BaslerSrc.ExposureAuto = 'Off';
          val2 = round(str2double(get(handles.edit_ExposureTime,'string')));
          val2 = min(val,1e6);
          val2 = max(val,59);
          handles.Camera.BaslerSrc.ExposureTime = val2;
       case 1
          handles.Camera.BaslerSrc.ExposureAuto = 'Continuous';
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Set AutoGain
function radiobutton_AutoGain_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = get(handles.radiobutton_AutoGain,'value');
   switch val
    case 0
    handles.Camera.BaslerSrc.GainAuto = 'Off';
    val2 = str2double(get(handles.edit_Gain,'string'));
    val2 = min(val, 12);
    val2 = max(val, 0);
    handles.Camera.BaslerSrc.Gain = val2;
    case 1
    handles.Camera.BaslerSrc.GainAuto = 'Continuous';
   end
end
%%% Save handles
guidata(hObject, handles);

%%% Set X_Binning
function popupmenu_X_Binning_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   handles.Camera.BaslerSrc.BinningHorizontal = get(handles.popupmenu_X_Binning,'value');  %%%  1---4
end
%%% Save handles
guidata(hObject, handles);

%%% Set Y_Binning
function popupmenu_Y_Binning_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   handles.Camera.BaslerSrc.BinningVertical = get(handles.popupmenu_Y_Binning,'value');  %%%  1---4
end
%%% Save handles
guidata(hObject, handles);

%%% Set CameraSavePath
function pushbutton_CameraSavePath_Callback(hObject, eventdata, handles)
handles.Camera.SavePath = uigetdir('E:\Data\','Please select path to save your images!');
set(handles.edit_CameraSavePath,'string', handles.Camera.SavePath);
%%% Save handles
guidata(hObject, handles);

%%% Edit CameraSavePath
function edit_CameraSavePath_Callback(hObject, eventdata, handles)
if exist(get(handles.edit_CameraSavePath,'string'), 'dir')==7
   handles.Camera.SavePath = get(handles.edit_CameraSavePath,'string');
end
%%% Save handles
guidata(hObject, handles);

%%% Set ExposureTime via edit
function edit_ExposureTime_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = round(str2double(get(handles.edit_ExposureTime,'string')));
   val = min(val,1e6);
   val = max(val,59);  
   set(handles.slider_ExposureTime,'value',val);
   handles.Camera.BaslerSrc.ExposureTime = val;
   set(handles.edit_FrameRate,'string',num2str(handles.Camera.BaslerSrc.ResultingFrameRate));
   set(handles.slider_FrameRate,'max',handles.Camera.BaslerSrc.ResultingFrameRate);
   set(handles.slider_FrameRate,'min',2e-3);
   set(handles.slider_FrameRate,'value',handles.Camera.BaslerSrc.ResultingFrameRate);
end
%%% Save handles
guidata(hObject, handles);

%%% Set ExposureTime via slider
function slider_ExposureTime_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = round(get(handles.slider_ExposureTime, 'value'));
   set(handles.edit_ExposureTime,'string',num2str(val));
   handles.Camera.BaslerSrc.ExposureTime = val;

   set(handles.edit_FrameRate,'string',num2str(handles.Camera.BaslerSrc.ResultingFrameRate));
   set(handles.slider_FrameRate,'max',handles.Camera.BaslerSrc.ResultingFrameRate);
   set(handles.slider_FrameRate,'min',2e-3);
   set(handles.slider_FrameRate,'value',handles.Camera.BaslerSrc.ResultingFrameRate);
end
%%% Save handles
guidata(hObject, handles);

%%% Set FrameRate via edit
function edit_FrameRate_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = str2double(get(handles.edit_FrameRate,'string'));
   FrameRateMax = handles.Camera.BaslerSrc.ResultingFrameRate;
   FrameRateMin = 2e-3;
   val = min(val, FrameRateMax);
   val = max(val, FrameRateMin);
   set(handles.slider_FrameRate,'value',val);
   handles.Camera.BaslerSrc.AcquisitionFrameRate = val;
end
%%% Save handles
guidata(hObject, handles);

%%% Set FrameRate via slider
function slider_FrameRate_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = get(handles.slider_FrameRate,'value');
   handles.Camera.BaslerSrc.AcquisitionFrameRate = val;
   set(handles.edit_FrameRate,'string',num2str(val));
end
%%% Save handles
guidata(hObject, handles);

%%% Set BlackLevel via edit
function edit_BlackLevel_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = round(str2double(get(handles.edit_BlackLevel,'string')));
   if find(ismember(handles.Camera.BitDepthOption,handles.Camera.BitDepth))==1
     val = min(val, 63.75);
     val = max(val, 0);
   else
     val = min(val, 255);
     val = max(val, 0);
   end
   set(handles.slider_BlackLevel,'value',val);
   handles.Camera.BaslerSrc.BlackLevel = val;
end
%%% Save handles
guidata(hObject, handles);

%%% Set BlackLevel via slider
function slider_BlackLevel_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = round(get(handles.slider_BlackLevel,'value'));
   handles.Camera.BaslerSrc.BlackLevel = val;
   set(handles.edit_BlackLevel,'string',num2str(val));
end
%%% Save handles
guidata(hObject, handles);

%%% Set Camera Gain via edit
function edit_Gain_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = str2double(get(handles.edit_Gain,'string'));
   val = min(val, 12);
   val = max(val, 0);
   set(handles.slider_Gain,'value',val);
   handles.Camera.BaslerSrc.Gain = val;
end
%%% Save handles
guidata(hObject, handles);

%%% Set Camera Gain via slider
function slider_Gain_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   val = get(handles.slider_Gain,'value');
   set(handles.edit_Gain,'string',num2str(val));
   handles.Camera.BaslerSrc.Gain = val;
end
%%% Save handles
guidata(hObject, handles);

%%% Camera Stream
function pushbutton_Stream_Callback(hObject, eventdata, handles)
if ~handles.Camera.StreamStatus
   handles.Camera.StreamStatus = 1; 
   %%% Clear current timer
   if ~isempty(timerfind)
      stop(timerfind);
      delete(timerfind);
   end
   %%% Set display
   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   set(handles.text_SurveyScanColorbarMin,'Visible','On');
   set(handles.edit_SurveyScanColorbarMin,'Visible','On');
   set(handles.text_SurveyScanColorbarMax,'Visible','On');
   set(handles.edit_SurveyScanColorbarMax,'Visible','On');
   set(handles.text_PixelInfoCriticalDisp,'Visible','On');
   set(handles.pushbutton_Stream,'BackgroundColor',[1 0 0]); 
   hImage = image(zeros(1024,1280),'Parent',handles.axes_CriticalDisplay);
   preview(handles.Camera.BaslerVid,hImage);
   % axes(handles.axes_CriticalDisplay);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize',8,'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   set(hImage,'Tag','axes_CriticalDisplay');
   
   t_stream = timer;
   t_stream.StartDelay = 0;
   % t_stream.TimerFcn = {@RetrieveFrameRateMax, handles.Camera, handles};
   t_stream.TimerFcn = {@RetrieveFrameRateMax, handles};
   t_stream.ExecutionMode = 'fixedRate';
   t_stream.Period = 0.2;
   start(t_stream);
   %%% Save handles
   guidata(hObject, handles);
else
end

%%% Camera Retrieve FrameRate
function varargout = RetrieveFrameRateMax(~, ~, handles)
val = handles.Camera.BaslerSrc.ResultingFrameRate;   
set(handles.slider_FrameRate,'max',val);
if get(handles.slider_FrameRate,'value') > val
   set(handles.slider_FrameRate,'value',val);
   set(handles.edit_FrameRate,'string',num2str(val));
   handles.Camera.BaslerSrc.AcquisitionFrameRate = get(handles.slider_FrameRate,'value'); 
end

%%% Camera Stop Stream
function pushbutton_StopStream_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus 
   if ~isempty(timerfind)
      stop(timerfind);
      delete(timerfind);
   end

   set(handles.pushbutton_Stream,'BackgroundColor',[0.94 0.94 0.94]); 
   stoppreview(handles.Camera.BaslerVid);
   cla(handles.axes_CriticalDisplay);
   colorbar('off');
   handles.Camera.StreamStatus = 0;
   %%% Save handles
   guidata(hObject, handles);
else
end

%%% Camera Snapshot
function pushbutton_Snapshot_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus
   handles.Camera.BaslerVid.FramesPerTrigger = 1;
   set(handles.pushbutton_Stream,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_Snapshot,'BackgroundColor',[1 0 0]); 
   start(handles.Camera.BaslerVid); 
   CameraFrame = getdata(handles.Camera.BaslerVid);
   stop(handles.Camera.BaslerVid); 
   %%% Save path
   if exist(handles.Camera.SavePath, 'dir')==7
   else
      SavePathRoot = 'E:\Data\';
      listing = dir(SavePathRoot);
      SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')];
      if isempty(find(ismember({listing.name},SaveFolder)))
         mkdir('E:\Data\',SaveFolder);
      else
      end
      handles.Camera.SavePath = [SavePathRoot,SaveFolder,'\'];       
      set(handles.edit_CameraSavePath,'string', handles.Camera.SavePath);
   end
   listing2 = ls([handles.Camera.SavePath, '*.tiff']);
   if ~isempty(listing2)
      Filename_num = str2num(listing2(size(listing2,1),14:17))+1;
      handles.Camera.SaveFilename = ['BaslerCamera_',num2str(Filename_num,'%04d')];
   else
      handles.Camera.SaveFilename = 'BaslerCamera_0001';
   end
   imwrite(CameraFrame,[handles.Camera.SavePath,handles.Camera.SaveFilename,'.tiff']);
   save([handles.Camera.SavePath,handles.Camera.SaveFilename,'.mat'],'CameraFrame');
   clear CameraFrame;
   
   handles.Camera.BaslerVid.FramesPerTrigger = round(str2double(get(handles.edit_SequenceSaveNum,'string')));
   set(handles.pushbutton_Snapshot,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_Stream,'BackgroundColor',[1 0 0]); 
   hImage = image(zeros(1024,1280),'Parent',handles.axes_CriticalDisplay);
   preview(handles.Camera.BaslerVid,hImage);
   
   handles.CriticalDispMode = [1 0 0 0 0];
   set(handles.radiobutton_SelectCamera,'value',1);
   set(handles.text_SurveyScanColorbarMin,'Visible','On');
   set(handles.edit_SurveyScanColorbarMin,'Visible','On');
   set(handles.text_SurveyScanColorbarMax,'Visible','On');
   set(handles.edit_SurveyScanColorbarMax,'Visible','On');
   set(handles.text_PixelInfoCriticalDisp,'Visible','On');
   % axes(handles.axes_CriticalDisplay);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize',8,'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   set(hImage,'Tag','axes_CriticalDisplay');
end
%%% Save handles
guidata(hObject, handles);

%%% Set SequenceSaveNum
function edit_SequenceSaveNum_Callback(hObject, eventdata, handles)
val = round(str2double(get(handles.edit_SequenceSaveNum,'string')));
val = max(val,1);
%%% Stop stream preview 
set(handles.pushbutton_Stream,'BackgroundColor',[0.94 0.94 0.94]); 
stoppreview(handles.Camera.BaslerVid);
stop(timerfind);
%%% Set para
handles.Camera.BaslerVid.FramesPerTrigger = val;
handles.Camera.BaslerSrc.AcquisitionBurstFrameCount = val;
%%% Set stream preview again
set(handles.pushbutton_Stream,'BackgroundColor',[1 0 0]); 
hImage = image(zeros(1024,1280),'Parent',handles.axes_CriticalDisplay);
preview(handles.Camera.BaslerVid,hImage);
% axes(handles.axes_CriticalDisplay);
colormap(handles.axes_CriticalDisplay,gray);
colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
set(handles.axes_CriticalDisplay,'FontSize',8,'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
set(hImage,'Tag','axes_CriticalDisplay');
   
start(timerfind);
%%% Save handles
guidata(hObject, handles);

%%% Using Camera Trigger
function radiobutton_CameraTrigger_Callback(hObject, eventdata, handles)
handles.Camera.SeqTrigStatus = get(handles.radiobutton_CameraTrigger,'value');
%%% Save handles
guidata(hObject, handles);

%%% Camera Sequence
function pushbutton_Sequence_Callback(hObject, eventdata, handles)
if handles.Camera.StreamStatus
   stop(timerfind);
   set(handles.pushbutton_Sequence,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_Stream,'BackgroundColor',[0.94 0.94 0.94]); 
   if handles.Camera.SeqTrigStatus
      triggerconfig(handles.Camera.BaslerVid, 'hardware', 'DeviceSpecific', 'DeviceSpecific');
      handles.Camera.BaslerSrc.TriggerMode = 'On';
      handles.Camera.BaslerSrc.TriggerSelector = 'FrameBurstStart';
      %%% Daq trigger setting
      DAQCfgImplicitTimingFiniSamps(handles.Daq.SeqTrig_Handle,1);
      DAQSetCOPulseDutyCyc(handles.Daq.SeqTrig_Handle, handles.Daq.SeqTrigChannel, 0.1);
      %%% Start sequence acquisition
      start(handles.Camera.BaslerVid);
      DAQStartTask(handles.Daq.SeqTrig_Handle);
      [CameraFrames TimeStamp] = getdata(handles.Camera.BaslerVid,handles.Camera.BaslerVid.FramesPerTrigger);
      CameraFrames = squeeze(CameraFrames);
      stop(handles.Camera.BaslerVid);      

      DAQStopTask(handles.Daq.SeqTrig_Handle);
      triggerconfig(handles.Camera.BaslerVid, 'immediate');
      handles.Camera.BaslerSrc.TriggerMode = 'Off';
   else
      triggerconfig(handles.Camera.BaslerVid, 'immediate');
      handles.Camera.BaslerSrc.TriggerMode = 'Off';
      start(handles.Camera.BaslerVid);
      [CameraFrames TimeStamp] = getdata(handles.Camera.BaslerVid,handles.Camera.BaslerVid.FramesPerTrigger);
      CameraFrames = squeeze(CameraFrames);
      stop(handles.Camera.BaslerVid);      
   end
   
   listing2 = ls([handles.Camera.SavePath, '*.tiff']);
   if ~isempty(listing2)
      Filename_num = str2num(listing2(size(listing2,1),14:17))+1;
      handles.Camera.SaveFilename = ['BaslerCamera_',num2str(Filename_num,'%04d')];
   else
      handles.Camera.SaveFilename = 'BaslerCamera_0001';
   end  
   for image_num = 1:handles.Camera.BaslerVid.FramesPerTrigger
       imwrite(CameraFrames(:,:,image_num),[handles.Camera.SavePath,handles.Camera.SaveFilename,'.tiff'],'WriteMode','append');
   end
   save([handles.Camera.SavePath,handles.Camera.SaveFilename,'.mat'],'CameraFrames');
   clear CameraFrames;
   
   set(handles.pushbutton_Sequence,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_Stream,'BackgroundColor',[1 0 0]); 
   hImage = image(zeros(1024,1280),'Parent',handles.axes_CriticalDisplay);
   preview(handles.Camera.BaslerVid,hImage);
   colormap(handles.axes_CriticalDisplay,gray);
   colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
   set(handles.axes_CriticalDisplay,'FontSize',8,'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
   set(hImage,'Tag','axes_CriticalDisplay');
   
   start(timerfind);
end
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SLM Parameters
%%% Exit or Init SLM
function pushbutton_ExitSLM_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus ~= 0
   close(SLM_Control);
   DispSystStatus(handles, 'SLM is closed !');
else
   %%% Init SLM
   SLM_Control; 
   DispSystStatus(handles, 'SLM Init Done !');
end
UpdateSLM_StatusDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% Start data acquisition 
function pushbutton_StartAcquisition_Callback(hObject, eventdata, handles)
%%% Close all shutters
if handles.Daq.Shutter0_SilenceStatus
else
   handles.Daq.Shutter0_Close();
end
handles.Daq.Shutter1_Close();
handles.Daq.Shutter2_Close();
ShutterStatusDisp(hObject, eventdata, handles);
%%% Query Z status if it is in use
if handles.Stages.UsageStatus(3)
   handles.Stages.QueryPosStageZ();
   set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
   set(handles.edit_SetPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
end
%%% Display reset
cla(handles.axes_Ch1);
cla(handles.axes_Ch2);
cla(handles.axes_Ch3);
cla(handles.axes_Ch4);
%%% Start acq according to different mode
switch handles.Daq.DaqMode    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 0  
    case 0  %%%  Angio SurveyScan, 4 AO tasks: 2 Galvo 1 Eom 1 FZ; 1 AI tasks/4 channels, FZ Static
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]); 
         %%%  Close accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On');
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');
            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         else
            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
         end
         %%%  Initial delays
         GalvoInitDelayTime = 2e-8;
         AI_InitDelayTime = handles.Galvo.GalvoFlybackTime + handles.Galvo.AcqDelayTime;  
         %%%  Configure tasks
         %%%  AO task for Galvo
         SequenceSize = 2*size(handles.Galvo.WaveformX,1);
         GalvoWaveform = int16(zeros(SequenceSize,1));
         for i = 1:2:SequenceSize-1
             GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
             GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
         end
         DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1));
         DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);
         DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Seconds);
         DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTime);
         DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1), 0, GalvoWaveform);       
         %%%  AO task for Eom Static Output
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
         DAQStopTask(handles.Eom.AO_Handle);
         %%%  AI task
         AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,4,'first')-1;
         AI_ReadChannel = ' ';
         for i = 1: length(AI_AcqChannel)
             ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
             if i ~= length(AI_AcqChannel)
                AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
             else
                AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
             end
         end
         DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);
         %%% Read offset of Pre-amps
         if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
            handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
            AI_SampNumPerChanTemp = 1000;
            AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
            AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
            DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
            DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
            DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
            DAQStartTask(handles.Daq.AI_Handle);
            DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
            DAQStopTask(handles.Daq.AI_Handle);
            AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
            AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
            for ii = 1:length(AI_AcqChannel) 
                AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
            end
            AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
            handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
         else
            handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
         end
         %%% AI configuration for Daq
         AI_SampNumPerChan = round((handles.Galvo.FrameLength-handles.Galvo.FrameRetraceLength)/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
         AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
         AI_Data = zeros(AI_SampNumAllChan, 1);  %%% May need average later 
         DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChan);
         DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.AI_Handle,'/PXI1Slot3/ao/StartTrigger',DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
         DAQSetStartTrigDelayUnits(handles.Daq.AI_Handle, DAQmx_Val_Seconds);
         DAQSetStartTrigDelay(handles.Daq.AI_Handle, AI_InitDelayTime);
         %%%  Start tasks      
         DAQStartTask(handles.Daq.AI_Handle);
         DAQStartTask(handles.Galvo.AO_Handle);
         handles.Daq.AcqShutterOpen();
         ShutterStatusDisp(hObject, eventdata, handles); %%% Pause included
         AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
         DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
         %%% Wait until done and read data
         for i = 1: 2
             pause(handles.Galvo.FrameLength/handles.Galvo.AO_UpdateRate/2);
             waitbar(i/2, AcqWaitbar,'Acquiring Data !'); 
         end
         close(AcqWaitbar);
         DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
         AI_Data = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChan, AI_Data);
         %%% Close shutter and stop tasks
         handles.Daq.AcqShutterClose();
         ShutterStatusDisp(hObject, eventdata, handles);
         DAQStopTask(handles.Galvo.AO_Handle);  
         DAQStopTask(handles.Daq.AI_Handle);
         %%% Set Eom output to minimum or keep it at the set value
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         if handles.Eom.LaserOutStatus
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
         else
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
         end
         DAQStopTask(handles.Eom.AO_Handle);
         %%% Reset start trigger
         DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
         %%% Process, display and save data 
         %%%% Retrieve data
         if handles.Daq.AI_VoltCaliFlag == 1
            AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)));
            AI_ImageRepLength = round(AI_SampNumPerChan/handles.Daq.DaqRepeat);
            AI_ImageLineLength = round(AI_SampNumPerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
            AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
            AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
            AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
            for i = 1: length(AI_AcqChannel)
                AI_DataTemp = AI_Data(i:length(AI_AcqChannel):end) - handles.Daq.AI_Offset(i);
                for j = 1: handles.Galvo.PixelY
                    for k = 1: handles.Galvo.PixelX
                        AI_DataTemp2 = 0;
                        for p = 1: handles.Daq.DaqRepeat
                            AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                                           +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
                        end    
                        AI_SaveData(j, k, i) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
                    end
                end
                AI_Volt(:,:,i) = handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,1)+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,2)*double(AI_SaveData(:,:,i))+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,3)*double(AI_SaveData(:,:,i).^2)+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,4)*double(AI_SaveData(:,:,i).^3);
                AI_SaveData(:,:,i) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_Volt(:,:,i)/2/handles.Daq.AI_Range(AI_AcqChannel(i)+1)*2^16);
            end
            %%%% Save data        
            if handles.Daq.SaveStatus
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               datetimestr = datestr(now,'HHMMSS');
               %%% Save tiff   
               Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.tiff'];
               for i = 1: length(AI_AcqChannel)
                   imwrite(uint16(AI_SaveData(:,:,i)),Savenametiff,'WriteMode','append');
               end
               %%% Save mat and para
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.mat'];
               save(Savenamemat,'AI_SaveData', 'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
               DispSystStatus(handles, ['Data saved ' datetimestr]);
            else
               datetimestr = datestr(now,'HHMMSS');  
               DispSystStatus(handles, ['Data acquired ' datetimestr]);
            end
         else     %%%%%  AI_VoltCaliFlag == 0
            AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)));
            AI_ImageRepLength = round(AI_SampNumPerChan/handles.Daq.DaqRepeat);
            AI_ImageLineLength = round(AI_SampNumPerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
            AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
            AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
            AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
            for i = 1: length(AI_AcqChannel)
                AI_DataTemp = AI_Data(i:length(AI_AcqChannel):end) - handles.Daq.AI_Offset(i);
                for j = 1: handles.Galvo.PixelY
                    for k = 1: handles.Galvo.PixelX
                        AI_DataTemp2 = 0;
                        for p = 1: handles.Daq.DaqRepeat
                            AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                                           +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
                        end    
                        AI_SaveData(j, k, i) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
                    end
                end
                AI_SaveData(:,:,i) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_SaveData(:,:,i));
            end  
            %%%% Save data         
            if handles.Daq.SaveStatus
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               datetimestr = datestr(now,'HHMMSS');
               if handles.Daq.BrainSurfaceSetStatus
                  Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                  Rel_Depth = max(Rel_Depth, 0);
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];  
               else                
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];
               end
               %%% Save tiff   
               for i = 1: length(AI_AcqChannel)
                   imwrite(uint16(AI_SaveData(:,:,i)),Savenametiff,'WriteMode','append');
               end
               %%% Save mat & para
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               save(Savenamemat,'AI_SaveData','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
               DispSystStatus(handles, ['Data saved ' datetimestr]);
            else
               datetimestr = datestr(now,'HHMMSS'); 
               DispSystStatus(handles, ['Data acquired ' datetimestr]);
            end
         end
         %%%% Display data
         handles.Daq.AI_SurveyScanImg = uint16(AI_SaveData);
         handles.Daq.SurveyImgActiveType = 0;
         DispAcqData(hObject, eventdata, handles, uint16(AI_SaveData));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 1        
    case 1        %%% Angiogram Acquisition, 4 AO tasks: 2 Galvo 1 Eom 1 FZ; 1 AI tasks/4 channels,FZ waveform       
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]);
         %%%  Close Accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On');
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         else
            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
         end
         %%%  Configure parameters
         FrameTrigInitDelayTicks = 2 + handles.Stages.StageFZ_SettleLength + ceil(handles.Stages.StageFZ_AcqDelayTime*handles.Stages.StageFZ_AO_UpdateRate);
         GalvoInitDelayTicks = 2;
         AI_InitDelayTime = handles.Galvo.GalvoFlybackTime+handles.Galvo.AcqDelayTime; 
         %%%  AO task for FZ
         StageFZ_Waveform = [handles.Stages.StageFZ_Waveform; handles.Stages.StageFZ_Waveform(end)*int16(ones(FrameTrigInitDelayTicks,1))];
         DAQCfgSampClkTimingFiniSamps(handles.Stages.StageFZ_Control_Handle,' ',handles.Stages.StageFZ_AO_UpdateRate, size(StageFZ_Waveform, 1));
         DAQSetStartTrigType(handles.Stages.StageFZ_Control_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Stages.StageFZ_Control_Handle, '/PXI1Slot4/PFI1', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Stages.StageFZ_Control_Handle, 0);
         DAQWriteBinaryI16(handles.Stages.StageFZ_Control_Handle, size(StageFZ_Waveform,1), 0, StageFZ_Waveform);
         %%%  Frame Trigger task
         FrameTriggerTickLength = handles.Stages.StageFZ_FrameLength;         
         FrameTriggerHighTickLength = round(0.2*handles.Stages.StageFZ_FrameLength); 
         FrameTriggerLowTickLength = FrameTriggerTickLength - FrameTriggerHighTickLength;
         DAQSetCOPulseTicksInitialDelay(handles.Daq.FrameTrig_Handle, handles.Daq.FrameTrigChannel, FrameTrigInitDelayTicks);
         DAQSetCOPulseHighTicks(handles.Daq.FrameTrig_Handle, handles.Daq.FrameTrigChannel, FrameTriggerHighTickLength);
         DAQSetCOPulseLowTicks(handles.Daq.FrameTrig_Handle, handles.Daq.FrameTrigChannel, FrameTriggerLowTickLength);
         DAQCfgImplicitTimingFiniSamps(handles.Daq.FrameTrig_Handle, handles.Daq.FrameNum);
         DAQSetStartTrigType(handles.Daq.FrameTrig_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.FrameTrig_Handle, '/PXI1Slot4/PFI1', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.FrameTrig_Handle, 0);
         %%%  AO task for Galvo
         SequenceSize = 2*size(handles.Galvo.WaveformX,1);
         GalvoWaveform = int16(zeros(SequenceSize,1));
         for i = 1:2:SequenceSize-1
             GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
             GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
         end
         DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1));
         DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot4/Ctr0InternalOutput', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 1);
         DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Ticks);
         DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTicks);
         DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1), 0, GalvoWaveform);
         %%%  AO task for Eom Static Output
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
         DAQStopTask(handles.Eom.AO_Handle);
         %%%  AI task
         AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,4,'first')-1;
         AI_ReadChannel = ' ';
         for ii = 1: length(AI_AcqChannel)
             ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(ii))];
             if ii ~= length(AI_AcqChannel)
                AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
             else
                AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
             end
         end
         DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);
         %%% Read offset of Pre-amps
         if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
            handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
            AI_SampNumPerChanTemp = 1000;
            AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
            AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
            DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
            DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
            DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
            DAQStartTask(handles.Daq.AI_Handle);
            DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
            DAQStopTask(handles.Daq.AI_Handle);
            AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
            AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
            for ii = 1:length(AI_AcqChannel) 
                AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
            end
            AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
            handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
         else
            handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
         end
         %%% AI configuration for Daq
         AI_SampNumPerChan = round((handles.Galvo.FrameLength-handles.Galvo.FrameRetraceLength)/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
         AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
         AI_DataPerFrame = int16(zeros(AI_SampNumAllChan,1));
         AI_Data = zeros(AI_SampNumAllChan*handles.Daq.FrameNum,1);  %%% May need average later
         DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChan);
         DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.AI_Handle,'/PXI1Slot3/ao/StartTrigger',DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 1);
         DAQSetStartTrigDelayUnits(handles.Daq.AI_Handle, DAQmx_Val_Seconds);
         DAQSetStartTrigDelay(handles.Daq.AI_Handle, AI_InitDelayTime);
         DAQSetBufInputBufSize(handles.Daq.AI_Handle, AI_SampNumAllChan*5); 
         %%%  Start tasks for stack acq      
         DAQStartTask(handles.Daq.AI_Handle);
         DAQStartTask(handles.Galvo.AO_Handle);        
         DAQStartTask(handles.Daq.FrameTrig_Handle);
         DAQStartTask(handles.Stages.StageFZ_Control_Handle);
         handles.Daq.AcqShutterOpen();
         ShutterStatusDisp(hObject, eventdata, handles);
         AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
         DAQWriteDigitalLines(handles.Daq.FZ_StartTrig_Handle, 1); 
         %%%  Read data
         for i = 1: handles.Daq.FrameNum
             AI_Data((i-1)*AI_SampNumAllChan+1:i*AI_SampNumAllChan) = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChan, AI_DataPerFrame);
             waitbar(i/handles.Daq.FrameNum,AcqWaitbar,'Acquiring Data !');
         end
         %%% Wait until done, close shutter and read data
         close(AcqWaitbar);
         DAQWaitUntilTaskDone(handles.Stages.StageFZ_Control_Handle, -1);
         DAQWaitUntilTaskDone(handles.Daq.FrameTrig_Handle, -1);
         handles.Daq.AcqShutterClose();
         ShutterStatusDisp(hObject, eventdata, handles);              
         %%% Stop tasks
         DAQStopTask(handles.Stages.StageFZ_Control_Handle);        
         DAQStopTask(handles.Daq.FrameTrig_Handle); 
         DAQStopTask(handles.Galvo.AO_Handle); 
         DAQStopTask(handles.Daq.AI_Handle);
         %%% Configure FZ to normal status 
         DAQCfgSampClkTimingFiniSamps(handles.Stages.StageFZ_Control_Handle,' ',handles.Stages.StageFZ_AO_UpdateRate, 2);
         DAQSetStartTrigType(handles.Stages.StageFZ_Control_Handle, DAQmx_Val_None);
         %%% Set Eom output to minimum or keep it at the set value
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         if handles.Eom.LaserOutStatus
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
         else
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
         end
         DAQStopTask(handles.Eom.AO_Handle);
         %%% Reset start trigger
         DAQWriteDigitalLines(handles.Daq.FZ_StartTrig_Handle, 0); 
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
         %%% Process, display and save data 
         %%%% Process data with different display option (Retrieve data if data display is chosen)
         if handles.Daq.DisplayStatus  %%% Display data
            if handles.Daq.AI_VoltCaliFlag == 1
               AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)*handles.Daq.FrameNum));
               AI_ImageRepLength = round(AI_SampNumPerChan/handles.Daq.DaqRepeat);
               AI_ImageLineLength = round(AI_SampNumPerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
               AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
               AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
               AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
               for fr = 1 : handles.Daq.FrameNum
                   for i = 1 : length(AI_AcqChannel)
                       AI_DataTemp = AI_Data(i+AI_SampNumAllChan*(fr-1):length(AI_AcqChannel):AI_SampNumAllChan*fr) - handles.Daq.AI_Offset(i);
                       AI_DataIndex = i+length(AI_AcqChannel)*(fr-1);
                       for j = 1 : handles.Galvo.PixelY
                           for k = 1 : handles.Galvo.PixelX
                               AI_DataTemp2 = 0;
                               for p = 1 : handles.Daq.DaqRepeat
                                   AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                                        +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
                               end    
                               AI_SaveData(j, k, AI_DataIndex) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
                           end
                       end
                       AI_Volt(:,:, AI_DataIndex) = handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,1)+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,2)*double(AI_SaveData(:,:,AI_DataIndex))+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,3)*double(AI_SaveData(:,:,AI_DataIndex).^2)+handles.Daq.AI_ScalingCoeff(AI_AcqChannel(i)+1,4)*double(AI_SaveData(:,:,AI_DataIndex).^3);
                       AI_SaveData(:,:, AI_DataIndex) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_Volt(:,:,AI_DataIndex)/2/handles.Daq.AI_Range(AI_AcqChannel(i)+1)*2^16);
                   end 
               end
               %%% Save data
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               datetimestr = datestr(now,'HHMMSS');
               %%% Save mat & para
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.mat'];
               save(Savenamemat,'AI_SaveData','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
               DispSystStatus(handles, ['Data saved ' datetimestr]);
            else  %%% handles.Daq.AI_VoltCaliFlag == 0
               AI_SaveData = int16(zeros(handles.Galvo.PixelY, handles.Galvo.PixelX, length(AI_AcqChannel)*handles.Daq.FrameNum));
               AI_ImageRepLength = round(AI_SampNumPerChan/handles.Daq.DaqRepeat);
               AI_ImageLineLength = round(AI_SampNumPerChan/handles.Galvo.PixelY/handles.Daq.DaqRepeat);
               AI_ImageRampLength = handles.Galvo.PixelX*handles.Daq.SamplePerPx;
               AI_ImageRetraceLength = round(handles.Galvo.FrameRetraceLength/handles.Galvo.AO_UpdateRate*handles.Daq.AI_SampleRate);
               AI_ImageOffset = round((AI_ImageLineLength - AI_ImageRetraceLength - AI_ImageRampLength)/2);
               for fr = 1 : handles.Daq.FrameNum
                   for i = 1 : length(AI_AcqChannel)
                       AI_DataTemp = AI_Data(i+AI_SampNumAllChan*(fr-1):length(AI_AcqChannel):AI_SampNumAllChan*fr) - handles.Daq.AI_Offset(i);
                       AI_DataIndex = i+length(AI_AcqChannel)*(fr-1);
                       for j = 1 : handles.Galvo.PixelY
                           for k = 1 : handles.Galvo.PixelX
                               AI_DataTemp2 = 0;
                               for p = 1 : handles.Daq.DaqRepeat
                                   AI_DataTemp2 = AI_DataTemp2 + sum(double(AI_DataTemp(AI_ImageOffset+1+(k-1)*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength...
                                        +(p-1)*AI_ImageRepLength:AI_ImageOffset+k*handles.Daq.SamplePerPx+(j-1)*AI_ImageLineLength+(p-1)*AI_ImageRepLength)));
                               end    
                               AI_SaveData(j, k, AI_DataIndex) = AI_DataTemp2/handles.Daq.SamplePerPx/handles.Daq.DaqRepeat;
                           end
                       end
                       AI_SaveData(:,:, AI_DataIndex) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(i)+1)*int16(AI_SaveData(:,:, AI_DataIndex));
                   end 
               end  
               %%% Save data
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               datetimestr = datestr(now,'HHMMSS');
               %%% Save tiff
               if ~any(AI_AcqChannel >= 5)
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.tiff'];
                  for iii = 1: size(AI_SaveData, 3)
                      imwrite(uint16(AI_SaveData(:,:,iii)),Savenametiff,'WriteMode','append');
                  end
               end
               %%% Save mat and para
               Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.mat'];
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               save(Savenamemat,'AI_SaveData','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
               DispSystStatus(handles, ['Data saved ' datetimestr]);
            end
            if handles.Stages.StageFZ_ReturnFlag
               AI_DispData = AI_SaveData(:,:,1:length(AI_AcqChannel));
            else
               AI_DispData = AI_SaveData(:,:, end-length(AI_AcqChannel)+1:end);     
            end
            handles.Daq.SurveyImgActiveType = 0;
            DispAcqData(hObject, eventdata, handles, AI_DispData);
         else  %%% Not display data but only save raw data
            %%% Save data
            if exist(handles.Daq.SavePath, 'dir')==7
            else
               SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
               mkdir('E:\Data\',SaveFolder);
               handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
            end
            datetimestr = datestr(now,'HHMMSS');
            %%% Save mat & para
            StagesPara = obj2struct(handles.Stages);
            EomPara = obj2struct(handles.Eom);
            GalvoPara = obj2struct(handles.Galvo);
            DaqPara = obj2struct(handles.Daq);
            CameraPara = obj2struct(handles.Camera);
            SLM_Para = obj2struct(handles.SLM);
            Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr,'.mat'];
            save(Savenamemat,'AI_Data','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
            DispSystStatus(handles, ['Data saved ' datetimestr]);
         end
         %%% Configure FZ stack info for next acquisition
         handles.Stages.QueryPosStageFZ();
         handles.Daq.StackInfo(1) = handles.Stages.CurrentPos(4);
         if handles.Daq.StackInfo(1) + (handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3)> 450
            handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + floor((450 - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3))*handles.Daq.StackInfo(3);
            handles.Daq.FrameNum = round((handles.Daq.StackInfo(2) - handles.Daq.StackInfo(1))/handles.Daq.StackInfo(3))+1;
         else
            handles.Daq.StackInfo(2) = handles.Daq.StackInfo(1) + (handles.Daq.FrameNum-1)*handles.Daq.StackInfo(3);
         end
         set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
         set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.CurrentPos(4))); 
         set(handles.edit_StackStart,'string',num2str(handles.Daq.StackInfo(1)));
         set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
         set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
         %%% Update FZ waveform
         handles.Stages.GenerateWaveformFZ(handles.Daq.StackInfo, handles.Daq.FrameRate, handles.Daq.DaqMode);
         handles.Stages.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 2  
    case 2      %%% pO2 SurveyScan (Fast), 4 AO tasks: 2 Galvo 1 Eom 1 Fast Z; 1 CI task, Static FZ              
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]);
         %%% Turn off photon counts monitor if it is on 
         if handles.Daq.PhotonCntsMoniStatus == 1 
            handles.Daq.PhotonCntsMoniStatus = 0;
            set(handles.radiobutton_PhotonCntsMoni,'value',0);
            set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
            set(handles.text_PhotonCntsMoni,'string',' ');
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
         end
         %%%  Close accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         end
         %%%  Close other possible timers
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         %%% Configure parameters
         LineNumTotal = handles.Galvo.PixelY;
         PixelNumTotal = handles.Galvo.PixelX*handles.Galvo.PixelY;
         GateNum = floor(handles.Eom.ExcPeriod/handles.Daq.PhotonCntrRes);
         CI_SampNumPerPixel = (GateNum+1)*handles.Eom.NumCycles;
         CI_SampNumPerLine = CI_SampNumPerPixel*handles.Galvo.PixelX;
         CI_TotalSampNum = CI_SampNumPerPixel*PixelNumTotal;
         CI_Data = uint32(zeros(CI_TotalSampNum,1));
         CI_DataSave = zeros(handles.Galvo.PixelY, handles.Galvo.PixelX);
         %%% Initial delay
         GalvoInitDelayTicks = 2;
         GalvoInertiaTicks = max(2, ceil(handles.Galvo.GalvoInertiaTime*handles.Galvo.AO_UpdateRate));
         LineTrigInitDelayTicks = GalvoInertiaTicks + ceil(handles.Galvo.GalvoFlybackTime*handles.Galvo.AO_UpdateRate);
         PixelTrigInitDelayTicks = 2;    
         EomExcTrigDelayTime = 2e-8;
         EomInitDelayTicks = 2;
         CISampClkInitDelayTime = 2e-8 + 91e-8; %%% Eom input output delay is 910 ns for 3.3 MHz Eom AO updaterate
         %%% Galvo AO task
         SequenceSize = 2*(handles.Galvo.FrameLength + LineTrigInitDelayTicks);
         GalvoWaveform = int16(zeros(SequenceSize,1));
         for i = 1:2:2*handles.Galvo.FrameLength-1
             GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
             GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
         end
         GalvoWaveform(2*handles.Galvo.FrameLength+1:2:end) = handles.Galvo.WaveformX(end);
         GalvoWaveform(2*handles.Galvo.FrameLength+2:2:end) = handles.Galvo.WaveformY(end);
         %%% Set Galvo AO parameters
         DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, handles.Galvo.FrameLength + LineTrigInitDelayTicks);
         DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);  
         DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Ticks);
         DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTicks);
         DAQWriteBinaryI16(handles.Galvo.AO_Handle,  handles.Galvo.FrameLength + LineTrigInitDelayTicks, 0, GalvoWaveform);
         %%% Line Trigger
         LineTickLength = handles.Galvo.LineLength;         
         LineHighTickLength = round(0.2*handles.Galvo.LineLength); 
         LineLowTickLength = LineTickLength - LineHighTickLength;
         DAQSetCOPulseTicksInitialDelay(handles.Daq.LineTrig_Handle, handles.Daq.LineTrigChannel, LineTrigInitDelayTicks);
         DAQSetCOPulseHighTicks(handles.Daq.LineTrig_Handle, handles.Daq.LineTrigChannel, LineHighTickLength);
         DAQSetCOPulseLowTicks(handles.Daq.LineTrig_Handle, handles.Daq.LineTrigChannel, LineLowTickLength);
         DAQCfgImplicitTimingFiniSamps(handles.Daq.LineTrig_Handle, handles.Galvo.PixelY);
         DAQSetStartTrigType(handles.Daq.LineTrig_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.LineTrig_Handle,'/PXI1Slot3/ao/StartTrigger', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.LineTrig_Handle, 0);
         DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.LineTrig_Handle, handles.Daq.LineTrigChannel, 1);
         %%% Pixel Trigger
         PixelTickLength = handles.Galvo.PixelTotalLength;         
         PixelHighTickLength = round(0.2*handles.Galvo.PixelTotalLength); 
         PixelLowTickLength = PixelTickLength - PixelHighTickLength;
         DAQSetCOPulseTicksInitialDelay(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelTrigInitDelayTicks);
         DAQSetCOPulseHighTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelHighTickLength);
         DAQSetCOPulseLowTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelLowTickLength);
         DAQCfgImplicitTimingFiniSamps(handles.Daq.PixelTrig_Handle, handles.Galvo.PixelX);
         DAQSetStartTrigType(handles.Daq.PixelTrig_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.PixelTrig_Handle,'/PXI1Slot4/Ctr1InternalOutput', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.PixelTrig_Handle, 1);
         DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, 1);
         %%% Eom Exc Trigger
         DAQSetCOPulseFreqInitialDelay(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, EomExcTrigDelayTime);
         DAQSetCOPulseFreq(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1/(handles.Eom.ExcPeriod+handles.Galvo.AcqDelayTime));
         DAQSetCOPulseDutyCyc(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 0.2);
         DAQCfgImplicitTimingFiniSamps(handles.Daq.EomExcTrig_Handle, handles.Eom.NumCycles);
         DAQSetStartTrigType(handles.Daq.EomExcTrig_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.EomExcTrig_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.EomExcTrig_Handle, 1);
         DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1);
         %%% Eom AO task
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', handles.Eom.AO_UpdateRate, size(handles.Eom.Waveform,1));
         DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_DigEdge);
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 1);
         DAQSetStartTrigDelayUnits(handles.Eom.AO_Handle, DAQmx_Val_Ticks);
         DAQSetStartTrigDelay(handles.Eom.AO_Handle, EomInitDelayTicks);
         DAQWriteBinaryI16(handles.Eom.AO_Handle, size(handles.Eom.Waveform,1), 0, handles.Eom.Waveform);
         %%% Photon counter sample clock
         DAQSetCOPulseFreqInitialDelay(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, CISampClkInitDelayTime);
         DAQSetCOPulseFreq(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1/handles.Daq.PhotonCntrRes);
         DAQSetCOPulseDutyCyc(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 0.5);
         DAQCfgImplicitTimingFiniSamps(handles.Daq.PhotonCntrSampClk_Handle, GateNum+1);
         DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_DigEdge);
         DAQCfgDigEdgeStartTrig(handles.Daq.PhotonCntrSampClk_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
         DAQSetStartTrigRetriggerable(handles.Daq.PhotonCntrSampClk_Handle, 1);
         DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1);
         %%%%% PhotonCntr configuration 
         DAQCfgSampClkTimingFiniSamps(handles.Daq.PhotonCntr_Handle,'/PXI1Slot3/Ctr1InternalOutput', 1e6, CI_TotalSampNum);   
         %%%%% AI task for Pos+Accelerometer recording
         if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
            DAQClearTask(handles.Daq.AI_Handle);
            handles.Daq.AI_Handle = DAQCreateTask('DaqAI');
            DAQCreateAIVoltageChan(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', [-5 5]);
            DAQSetRefClkSrc(handles.Daq.AI_Handle, '/PXI1Slot2/PXIe_Clk100');
            DAQSetAICoupling(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', DAQmx_Val_DC);
            
            AI_SampClkInitDelayTime = 2e-8 + CISampClkInitDelayTime;
            AI_InitDelayTime = 2e-8;
            AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,3,'first')-1;
            AI_ReadChannel = ' ';
            for i = 1: length(AI_AcqChannel)
                ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
                if i ~= length(AI_AcqChannel)
                   AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
                else
                   AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
                end
                DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
                DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
            end
            DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);
            %%% Read offset of Pre-amps
            if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
               handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
               AI_SampNumPerChanTemp = 1000;
               AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
               AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
               DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
               DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
               DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
               DAQStartTask(handles.Daq.AI_Handle);
               DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
               DAQStopTask(handles.Daq.AI_Handle);
               AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
               AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
               for ii = 1:length(AI_AcqChannel) 
                   AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
               end
               AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
               handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
            else
               handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
            end
            %%% AI configuration for acq
            AI_SampNumPerChan = max(1,floor(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)*PixelNumTotal);
            AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
            AI_SampNumPerChanPerLine = max(1,floor(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)*handles.Galvo.PixelX);
            AI_SampNumAllChanPerLine = AI_SampNumPerChanPerLine*length(AI_AcqChannel);
            AI_Data = zeros(AI_SampNumAllChan, 1);
            AI_DataPerLine = zeros(AI_SampNumAllChanPerLine, 1);
            DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle,'/PXI1Slot2/Ctr3InternalOutput', handles.Daq.AI_SampleRate, AI_SampNumPerChan);           
            DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
            %%%%% AI SampClk configuration
            DAQSetCOPulseFreqInitialDelay(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, AI_SampClkInitDelayTime);
            DAQSetCOPulseFreq(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, handles.Daq.AI_SampleRate);
            DAQSetCOPulseDutyCyc(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 0.5);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.AI_SampClkTD_Handle, max(1,floor(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)));
            DAQSetStartTrigType(handles.Daq.AI_SampClkTD_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.AI_SampClkTD_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.AI_SampClkTD_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 1);
            %%%%% Start AI related tasks
            DAQStartTask(handles.Daq.AI_Handle);
            DAQStartTask(handles.Daq.AI_SampClkTD_Handle);
         else
         end
         %%%%% Start tasks
         DAQStartTask(handles.Daq.LineTrig_Handle);
         DAQStartTask(handles.Daq.PixelTrig_Handle);
         DAQStartTask(handles.Daq.EomExcTrig_Handle);
         DAQStartTask(handles.Eom.AO_Handle);
         DAQStartTask(handles.Daq.PhotonCntrSampClk_Handle);
         DAQStartTask(handles.Daq.PhotonCntr_Handle);
         DAQStartTask(handles.Galvo.AO_Handle); 
         %%%%% Open shutter  
         handles.Daq.AcqShutterOpen();
         ShutterStatusDisp(hObject, eventdata, handles);
         AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
         DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
         %%%%% Acquire data
         if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
            for i = 1:LineNumTotal
                %%% pause(handles.Galvo.LineLength/handles.Galvo.AO_UpdateRate);
                CI_Data((i-1)*CI_SampNumPerLine+1:i*CI_SampNumPerLine,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerLine); 
                AI_Data((i-1)*AI_SampNumAllChanPerLine+1:i*AI_SampNumAllChanPerLine,1) = DAQReadAnalogF64(handles.Daq.AI_Handle, AI_SampNumPerChanPerLine, AI_DataPerLine);
                waitbar(i/LineNumTotal, AcqWaitbar,'Acquiring Data !'); 
            end
            DAQWaitUntilTaskDone(handles.Galvo.AO_Handle, -1);
            DAQWaitUntilTaskDone(handles.Daq.LineTrig_Handle, -1);
            DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
            DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
            DAQStopTask(handles.Daq.AI_Handle);
            DAQStopTask(handles.Daq.AI_SampClkTD_Handle);
            close(AcqWaitbar);
         else
            for i = 1:LineNumTotal
                %%% pause(handles.Galvo.LineLength/handles.Galvo.AO_UpdateRate);
                CI_Data((i-1)*CI_SampNumPerLine+1:i*CI_SampNumPerLine,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerLine); 
                waitbar(i/LineNumTotal, AcqWaitbar,'Acquiring Data !'); 
            end
            DAQWaitUntilTaskDone(handles.Galvo.AO_Handle, -1);
            DAQWaitUntilTaskDone(handles.Daq.LineTrig_Handle, -1);
            DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
            close(AcqWaitbar);
        end
        %%%  Close shutter & stop tasks
        handles.Daq.AcqShutterClose();
        ShutterStatusDisp(hObject, eventdata, handles);
        DAQStopTask(handles.Galvo.AO_Handle); 
        DAQStopTask(handles.Daq.LineTrig_Handle);
        DAQStopTask(handles.Daq.PixelTrig_Handle);
        DAQStopTask(handles.Daq.EomExcTrig_Handle);
        DAQStopTask(handles.Eom.AO_Handle);
        DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
        DAQStopTask(handles.Daq.PhotonCntr_Handle); 
         %%% Set Eom output to minimum
         DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
         DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
         DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
         DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
         DAQStopTask(handles.Eom.AO_Handle);
         %%% Reset start trigger
         DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
         set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
         %%% Process & save data
         CI_DataTemp0 = reshape(CI_Data,[CI_SampNumPerPixel PixelNumTotal])';
         CI_DataProcessed = zeros(PixelNumTotal, 1);
         if handles.Daq.AcqAllPhotonStatus == 0
            CI_GateOffset = floor(handles.Eom.GateWidth/handles.Daq.PhotonCntrRes)+1;
         else
            CI_GateOffset = 1; 
         end
         for i = 1: PixelNumTotal
             CI_Temp0 = double(CI_DataTemp0(i,:)); 
             CI_Temp1 = zeros(1,GateNum);
             for j = 1: handles.Eom.NumCycles
                 CI_Temp2 = diff(CI_Temp0((j-1)*(GateNum+1)+1:j*(GateNum+1)), 1);
                 CI_Temp2(find(CI_Temp2<0)) = 2^32-1+CI_Temp2(find(CI_Temp2<0));
                 CI_Temp1 = CI_Temp1 + CI_Temp2;
             end
             CI_DataProcessed(i) = sum(CI_Temp1(CI_GateOffset:end))/handles.Eom.NumCycles;
         end
         CI_DataSave = reshape(CI_DataProcessed, [handles.Galvo.PixelX handles.Galvo.PixelY])';
         handles.Daq.SurveyScanImg = CI_DataSave;
         %%% Display data
         handles.Daq.SurveyImgActiveType = 1;
         DispAcqData(hObject, eventdata, handles, CI_DataSave);
         handles.CriticalDispMode = [0 0 1 0 0];
         set(handles.radiobutton_SelectCh1,'value',1);
         set(handles.text_SurveyScanColorbarMin,'Visible','On');
         set(handles.edit_SurveyScanColorbarMin,'Visible','On');
         set(handles.text_SurveyScanColorbarMax,'Visible','On');
         set(handles.edit_SurveyScanColorbarMax,'Visible','On');
         set(handles.text_PixelInfoCriticalDisp,'Visible','On');
         %%% Plot points
         axes(handles.axes_CriticalDisplay);
         if handles.Daq.SurveyScanFtrStatus
            SurveyScanTemp = medfilt2(handles.Daq.SurveyScanImg,[2 2],'symmetric');
         else
            SurveyScanTemp = handles.Daq.SurveyScanImg;
         end
         handles.Daq.SurveyScanColorbarMin = min(SurveyScanTemp(:));
         if max(SurveyScanTemp(:)) > min(SurveyScanTemp(:))
            handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:));
         else
            handles.Daq.SurveyScanColorbarMax = max(SurveyScanTemp(:))+10; 
         end
         set(handles.edit_SurveyScanColorbarMin, 'string', num2str(handles.Daq.SurveyScanColorbarMin));
         set(handles.edit_SurveyScanColorbarMax, 'string', num2str(handles.Daq.SurveyScanColorbarMax));
         h_img = imagesc(fliplr(SurveyScanTemp), [handles.Daq.SurveyScanColorbarMin handles.Daq.SurveyScanColorbarMax]);
         colormap(handles.axes_CriticalDisplay,gray);
         colorbar(handles.axes_CriticalDisplay, 'Position', [0.835    0.08    0.02    0.88]);
         set(handles.axes_CriticalDisplay,'FontSize', 8, 'OuterPosition',[0.26 -0.02 0.72 1.03], 'Position',[0.28 0.08 0.545 0.88]);
         s_ind = get(handles.listbox_PixelSelected, 'value');

         if ~isempty(handles.Galvo.PO2PosList)
            for i = 1: size(handles.Galvo.PO2PosList,1)
                s{i} = sprintf('%d, %d',[handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(i, 1) handles.Galvo.PO2PosList(i, 2)]);
            end
            set(handles.listbox_PixelSelected,'string', s);
            s_nind = setdiff(1:size(handles.Galvo.PO2PosList,1),s_ind);
            hold on
            h_pts = plot(handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_nind,1), handles.Galvo.PO2PosList(s_nind,2),'r.',...
                  handles.Galvo.PixelX+1-handles.Galvo.PO2PosList(s_ind,1), handles.Galvo.PO2PosList(s_ind,2),'g.');
            set(h_pts,'MarkerSize',8);
            hold off
            set(h_pts,'Tag','axes_CriticalDisplay');
         end  
         h_buttondown ='PLIM_PO2(''axes_CriticalDisplay_ButtonDownFcn'',gcbo,[],guidata(gcbo))';
         set(handles.axes_CriticalDisplay,'ButtonDownFcn',h_buttondown);
         set(get(handles.axes_CriticalDisplay,'children'), 'ButtonDownFcn',h_buttondown); 
         %%% Rename image tag
         set(h_img,'Tag','axes_CriticalDisplay');
         %%% Save data, img and parameters
         if handles.Daq.SaveStatus
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               AI_DataSave = zeros(length(AI_AcqChannel), AI_SampNumPerChan);
               for iii = 1:length(AI_AcqChannel)
                   %%% AI_DataSave(iii,:) = AI_Data(iii:length(AI_AcqChannel):end);
                   AI_DataSave(iii,:) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(iii)+1)*AI_Data(iii:length(AI_AcqChannel):end);
               end
               %%% Save data 
               datetimestr = datestr(now,'HHMMSS');
               if handles.Daq.BrainSurfaceSetStatus
                  Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                  Rel_Depth = max(Rel_Depth, 0);
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];  
               else                
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];
               end
               imwrite(uint16(CI_DataSave/max(CI_DataSave(:))*65535), Savenametiff,'WriteMode','overwrite');
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               save(Savenamemat,'CI_DataSave','AI_DataSave','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara','CameraPara', 'SLM_Para');
            else
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               %%% Save data and para
               datetimestr = datestr(now,'HHMMSS');
               if handles.Daq.BrainSurfaceSetStatus
                  Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                  Rel_Depth = max(Rel_Depth, 0);
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];  
               else                
                  Savenametiff = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.tiff'];
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];
               end
               imwrite(uint16(CI_DataSave/max(CI_DataSave(:))*65535), Savenametiff,'WriteMode','overwrite');
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM);
               save(Savenamemat,'CI_DataSave','StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
            end
            DispSystStatus(handles, ['Data saved ' datetimestr]);
         else
            datetimestr = datestr(now,'HHMMSS'); 
            DispSystStatus(handles, ['Data acquired ' datetimestr]);
         end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 3  
    case 3        %%% pO2 Acq Galvo TD, 4 AO tasks: 2 Galvo 1 Eom 1 Fast Z; 1 CI task; Static FZ
         %%% Turn off photon counts monitor if it is on 
         if handles.Daq.PhotonCntsMoniStatus == 1 
            handles.Daq.PhotonCntsMoniStatus = 0;
            set(handles.radiobutton_PhotonCntsMoni,'value',0);
            set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
            set(handles.text_PhotonCntsMoni,'string',' ');
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
         end
         %%%  Close accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         end
         %%%  Close other possible timers
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         %%%  Configure para
         if isempty(handles.Galvo.PO2Pos)
            DispSystStatus(handles, 'Target points not selected !'); 
         else
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]);
            PixelNumTotal = size(handles.Galvo.PO2Pos,1)*handles.Daq.DaqRepeat;
            GateNum = floor(handles.Eom.ExcPeriod/handles.Daq.PhotonCntrRes);
            CI_SampNumPerPixel = (GateNum+1)*handles.Eom.NumCycles;
            CI_TotalSampNum = CI_SampNumPerPixel*PixelNumTotal;
            CI_TotalCycNum = handles.Eom.NumCycles*PixelNumTotal;
            CI_Data = uint32(zeros(CI_TotalSampNum,1));
            %%% Initial delay
            GalvoInitDelayTicks = 2;
            GalvoInertiaTicks = max(2, ceil(handles.Galvo.GalvoInertiaTime*handles.Galvo.AO_UpdateRate));
            PixelTrigInitDelayTicks = GalvoInertiaTicks + ceil(handles.Galvo.GalvoFlybackTime*handles.Galvo.AO_UpdateRate); 
            EomExcTrigDelayTime = 2e-8;
            EomInitDelayTicks = 2;
            CISampClkInitDelayTime = 2e-8 + 91e-8; %%% Eom input output delay is 910 ns for 3.3 MHz Eom AO updaterate
            %%% Configure tasks
            %%% AO task for Galvo
            SequenceSize = 2*size(handles.Galvo.WaveformX,1);
            GalvoWaveform = int16(zeros(SequenceSize,1));
            for i = 1:2:SequenceSize-1
                GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
                GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
            end
            GalvoWaveform = [GalvoWaveform; zeros(PixelTrigInitDelayTicks*2,1)]; 
            DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1)+PixelTrigInitDelayTicks);
            DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);
            DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Ticks);
            DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTicks);
            DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1)+PixelTrigInitDelayTicks, 0, GalvoWaveform);
            %%%%% PixelTrigger 
            PixelTickLength = handles.Galvo.PixelTotalLength;         
            PixelHighTickLength = round(0.2*handles.Galvo.PixelTotalLength); 
            PixelLowTickLength = PixelTickLength - PixelHighTickLength;
            DAQSetCOPulseTicksInitialDelay(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelTrigInitDelayTicks);
            DAQSetCOPulseHighTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelHighTickLength);
            DAQSetCOPulseLowTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelLowTickLength);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PixelTrig_Handle, PixelNumTotal);
            DAQSetStartTrigType(handles.Daq.PixelTrig_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.PixelTrig_Handle,'/PXI1Slot3/ao/StartTrigger', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.PixelTrig_Handle, 0);
            %%% Eom Exc Trigger
            DAQSetCOPulseFreqInitialDelay(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, EomExcTrigDelayTime);
            DAQSetCOPulseFreq(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1/(handles.Eom.ExcPeriod+handles.Galvo.AcqDelayTime));
            DAQSetCOPulseDutyCyc(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 0.2);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.EomExcTrig_Handle, handles.Eom.NumCycles);
            DAQSetStartTrigType(handles.Daq.EomExcTrig_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.EomExcTrig_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.EomExcTrig_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1);
            %%%%% Eom AO task
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', handles.Eom.AO_UpdateRate, size(handles.Eom.Waveform,1));
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 1);
            DAQSetStartTrigDelayUnits(handles.Eom.AO_Handle, DAQmx_Val_Ticks);
            DAQSetStartTrigDelay(handles.Eom.AO_Handle, EomInitDelayTicks);
            DAQWriteBinaryI16(handles.Eom.AO_Handle, size(handles.Eom.Waveform,1), 0, handles.Eom.Waveform);
            %%%%% Photon counter sample clock 
            DAQSetCOPulseFreqInitialDelay(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, CISampClkInitDelayTime);
            DAQSetCOPulseFreq(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1/handles.Daq.PhotonCntrRes);
            DAQSetCOPulseDutyCyc(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 0.5);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PhotonCntrSampClk_Handle, GateNum+1);
            DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.PhotonCntrSampClk_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.PhotonCntrSampClk_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1);
            %%%%% PhotonCntr 
            DAQCfgSampClkTimingFiniSamps(handles.Daq.PhotonCntr_Handle,'/PXI1Slot3/Ctr1InternalOutput', 1e6, CI_TotalSampNum);   
            %%%%% AI task for Pos+Accelerometer recording
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               DAQClearTask(handles.Daq.AI_Handle);
               handles.Daq.AI_Handle = DAQCreateTask('DaqAI');
               DAQCreateAIVoltageChan(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', [-5 5]);
               DAQSetRefClkSrc(handles.Daq.AI_Handle, '/PXI1Slot2/PXIe_Clk100');
               DAQSetAICoupling(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', DAQmx_Val_DC);
            
               AI_SampClkInitDelayTime = 2e-8 + CISampClkInitDelayTime;
               AI_InitDelayTime = 2e-8;
               AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,3,'first')-1;
               AI_ReadChannel = ' ';
               for i = 1: length(AI_AcqChannel)
                   ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
                   if i ~= length(AI_AcqChannel)
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
                   else
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
                   end
                   DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
                   DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
               end
               DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);   
               %%% Read offset of Pre-amps
               if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
                  AI_SampNumPerChanTemp = 1000;
                  AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
                  AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
                  DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
                  DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
                  DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
                  DAQStartTask(handles.Daq.AI_Handle);
                  DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
                  DAQStopTask(handles.Daq.AI_Handle);
                  AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
                  AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
                  for ii = 1:length(AI_AcqChannel) 
                      AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
                  end
                  AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
                  handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
               else
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
               end
               %%% AI configuration for acq
               AI_SampNumPerChan = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)*PixelNumTotal;
               AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
               AI_SampNumPerChanPerPixel = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate);
               AI_SampNumAllChanPerPixel = AI_SampNumPerChanPerPixel*length(AI_AcqChannel);
               AI_Data = zeros(AI_SampNumAllChan, 1); 
               AI_DataPerPixel = zeros(AI_SampNumAllChanPerPixel, 1); 
               DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle,'/PXI1Slot2/Ctr3InternalOutput', handles.Daq.AI_SampleRate, AI_SampNumPerChan);
               DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
               %%%%% AI SampClk configuration
               DAQSetCOPulseFreqInitialDelay(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, AI_SampClkInitDelayTime);
               DAQSetCOPulseFreq(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, handles.Daq.AI_SampleRate);
               DAQSetCOPulseDutyCyc(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 0.5);
               DAQCfgImplicitTimingFiniSamps(handles.Daq.AI_SampClkTD_Handle, round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate));
               DAQSetStartTrigType(handles.Daq.AI_SampClkTD_Handle, DAQmx_Val_DigEdge);
               DAQCfgDigEdgeStartTrig(handles.Daq.AI_SampClkTD_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
               DAQSetStartTrigRetriggerable(handles.Daq.AI_SampClkTD_Handle, 1);
               DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 1);
               %%%%% Start AI related tasks
               DAQStartTask(handles.Daq.AI_Handle);
               DAQStartTask(handles.Daq.AI_SampClkTD_Handle);
            else
            end
            %%%%% Start tasks
            DAQStartTask(handles.Galvo.AO_Handle); 
            DAQStartTask(handles.Daq.PixelTrig_Handle);
            DAQStartTask(handles.Daq.EomExcTrig_Handle);
            DAQStartTask(handles.Eom.AO_Handle);
            DAQStartTask(handles.Daq.PhotonCntrSampClk_Handle);
            DAQStartTask(handles.Daq.PhotonCntr_Handle);
            %%%%% Open shutter  
            handles.Daq.AcqShutterOpen();
            ShutterStatusDisp(hObject, eventdata, handles);
            AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
            %%%%% Start
            DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
            %%%%% Acquire data
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               for i = 1: PixelNumTotal
                   CI_Data((i-1)*CI_SampNumPerPixel+1:i*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);
                   AI_Data((i-1)*AI_SampNumAllChanPerPixel+1:i*AI_SampNumAllChanPerPixel,1) = DAQReadAnalogF64(handles.Daq.AI_Handle, AI_SampNumPerChanPerPixel, AI_DataPerPixel);
                   waitbar(i/PixelNumTotal,AcqWaitbar,'Acquiring Data !'); 
               end
               DAQWaitUntilTaskDone(handles.Galvo.AO_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.PixelTrig_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
               DAQStopTask(handles.Daq.AI_Handle);
               DAQStopTask(handles.Daq.AI_SampClkTD_Handle);
               close(AcqWaitbar);
            else
               for i = 1: PixelNumTotal
                   CI_Data((i-1)*CI_SampNumPerPixel+1:i*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);
                   waitbar(i/PixelNumTotal,AcqWaitbar,'Acquiring Data !'); 
               end
               DAQWaitUntilTaskDone(handles.Galvo.AO_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.PixelTrig_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
               close(AcqWaitbar);
            end
            %%%  Close shutter & stop tasks
            handles.Daq.AcqShutterClose();
            ShutterStatusDisp(hObject, eventdata, handles);
            DAQStopTask(handles.Galvo.AO_Handle);         
            DAQStopTask(handles.Daq.PixelTrig_Handle);
            DAQStopTask(handles.Daq.EomExcTrig_Handle);
            DAQStopTask(handles.Eom.AO_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            %%% Set Eom output to minimum
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
            DAQStopTask(handles.Eom.AO_Handle);
            %%% Reset start trigger
            DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
            %%% Process and save data
            CI_DataSave = uint32(zeros(CI_TotalCycNum,GateNum));
            CI_DataProcessed = zeros(PixelNumTotal, GateNum);
            CI_DataTemp0 = reshape(CI_Data,[(GateNum+1) CI_TotalCycNum])';
            CI_Temp1 = diff(double(CI_DataTemp0),1,2);
            CI_Temp1(find(CI_Temp1<0)) = 2^32-1+CI_Temp1(find(CI_Temp1<0));
            CI_DataSave = CI_Temp1;
            for i = 1: PixelNumTotal
                CI_Temp2 = CI_Temp1((i-1)*handles.Eom.NumCycles+1:i*handles.Eom.NumCycles,:); 
                CI_DataProcessed(i,:) = sum(CI_Temp2,1);
            end
            CI_PO2Pos = handles.Galvo.PO2Pos;
            CI_SurveyScanImg = handles.Daq.SurveyScanImg;
            %%% Save data and parameters
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               AI_DataSave = zeros(length(AI_AcqChannel), AI_SampNumPerChan);
               for iii = 1:length(AI_AcqChannel)
                   AI_DataSave(iii,:) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(iii)+1)*AI_Data(iii:length(AI_AcqChannel):end);
               end
               %%% Save mat and para 
               datetimestr = datestr(now,'HHMMSS');
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM); 
               if handles.Daq.BrainSurfaceSetStatus
                  Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                  Rel_Depth = max(Rel_Depth, 0);
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
               else
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
               end
               if handles.Daq.AI_SampleRate <= 1e3
                  save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg','AI_DataSave',...
                      'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara','CameraPara', 'SLM_Para');
               else
                  save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg','AI_DataSave',...
                      'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara','CameraPara', 'SLM_Para','-v7.3'); 
               end
            else
               if exist(handles.Daq.SavePath, 'dir')==7
               else
                  SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                  mkdir('E:\Data\',SaveFolder);
                  handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
               end
               %%% Save mat and para 
               datetimestr = datestr(now,'HHMMSS');
               StagesPara = obj2struct(handles.Stages);
               EomPara = obj2struct(handles.Eom);
               GalvoPara = obj2struct(handles.Galvo);
               DaqPara = obj2struct(handles.Daq);
               CameraPara = obj2struct(handles.Camera);
               SLM_Para = obj2struct(handles.SLM); 
               if handles.Daq.BrainSurfaceSetStatus
                  Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                  Rel_Depth = max(Rel_Depth, 0);
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
               else
                  Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
               end
               save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg',...
                   'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
            end
            DispSystStatus(handles, ['Data saved ' datetimestr]);
         end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 4  
    case 4        %%% pO2 Acq TD DeepTissueSlow, 4 AO tasks: 2 Galvo 1 Eom 1 Fast Z; 1 CI task; Static FZ
         %%% Turn off photon counts monitor if it is on 
         if handles.Daq.PhotonCntsMoniStatus == 1 
            handles.Daq.PhotonCntsMoniStatus = 0;
            set(handles.radiobutton_PhotonCntsMoni,'value',0);
            set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
            set(handles.text_PhotonCntsMoni,'string',' ');
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
         end
         %%%  Close accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         end
         %%%  Close other possible timers
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         %%%  Configure para 
         if isempty(handles.Galvo.PO2Pos)| handles.SLM.UsageStatus~=1 
            DispSystStatus(handles, 'Target points not selected or SLM is not initialized!'); 
         else
            %%% Define variables
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]);
            PixelNumTotal = size(handles.Galvo.PO2Pos,1);
            GateNum = floor(handles.Eom.ExcPeriod/handles.Daq.PhotonCntrRes);
            CI_SampNumPerPixel = (GateNum+1)*handles.Eom.NumCycles;            
            CI_TotalSampNum = CI_SampNumPerPixel*PixelNumTotal*length(handles.SLM.VortexChargeListAcq);
            CI_TotalCycNum = handles.Eom.NumCycles*PixelNumTotal;
            CI_Data = uint32(zeros(CI_TotalSampNum, 1));
            %%% Initial delay
            EomExcTrigDelayTime = 2e-8;
            EomInitDelayTicks = 2;
            CISampClkInitDelayTime = 2e-8 + 91e-8; %%% Eom input output delay is 910 ns for 3.3 MHz Eom AO updaterate
            %%% Configure tasks
            %%% AO task for Galvo
            DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, 2);
            DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_None);
            DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 0);
            %%%%% PixelTrigger             
            PixelTrigWaitTime = handles.Galvo.PixelTotalLength/handles.Galvo.AO_UpdateRate;
            DAQClearTask(handles.Daq.PixelTrig_Handle);
            handles.Daq.PixelTrig_Handle = DAQCreateTask('PixelTrigger');
            DAQCreateCOPulseChanFreq(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, 2e-8, 100000, 0.2);
            DAQSetRefClkSrc(handles.Daq.PixelTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PixelTrig_Handle, 1);
            DAQSetStartTrigType(handles.Daq.PixelTrig_Handle, DAQmx_Val_None);
            %%% Eom Exc Trigger
            DAQSetCOPulseFreqInitialDelay(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, EomExcTrigDelayTime);
            DAQSetCOPulseFreq(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1/(handles.Eom.ExcPeriod+handles.Galvo.AcqDelayTime));
            DAQSetCOPulseDutyCyc(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 0.2);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.EomExcTrig_Handle, handles.Eom.NumCycles);
            DAQSetStartTrigType(handles.Daq.EomExcTrig_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.EomExcTrig_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.EomExcTrig_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1);
            %%%%% Eom AO task
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', handles.Eom.AO_UpdateRate, size(handles.Eom.Waveform,1));
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 1);
            DAQSetStartTrigDelayUnits(handles.Eom.AO_Handle, DAQmx_Val_Ticks);
            DAQSetStartTrigDelay(handles.Eom.AO_Handle, EomInitDelayTicks);
            DAQWriteBinaryI16(handles.Eom.AO_Handle, size(handles.Eom.Waveform,1), 0, handles.Eom.Waveform);
            %%%%% Photon counter sample clock 
            DAQSetCOPulseFreqInitialDelay(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, CISampClkInitDelayTime);
            DAQSetCOPulseFreq(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1/handles.Daq.PhotonCntrRes);
            DAQSetCOPulseDutyCyc(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 0.5);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PhotonCntrSampClk_Handle, GateNum+1);
            DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.PhotonCntrSampClk_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.PhotonCntrSampClk_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1);
            %%%%% Photon counter 
            DAQCfgSampClkTimingFiniSamps(handles.Daq.PhotonCntr_Handle,'/PXI1Slot3/Ctr1InternalOutput', 1e6, CI_TotalSampNum);              
            %%%%% AI task for Pos+Accelerometer recording
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               DAQClearTask(handles.Daq.AI_Handle);
               handles.Daq.AI_Handle = DAQCreateTask('DaqAI');
               DAQCreateAIVoltageChan(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', [-5 5]);
               DAQSetRefClkSrc(handles.Daq.AI_Handle, '/PXI1Slot2/PXIe_Clk100');
               DAQSetAICoupling(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', DAQmx_Val_DC);
            
               AI_SampClkInitDelayTime = 2e-8 + CISampClkInitDelayTime;
               AI_InitDelayTime = 2e-8;
               AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,3,'first')-1;
               AI_ReadChannel = ' ';
               for i = 1: length(AI_AcqChannel)
                   ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
                   if i ~= length(AI_AcqChannel)
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
                   else
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
                   end
                   DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
                   DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
               end
               DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);   
               %%% Read offset of Pre-amps
               if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
                  AI_SampNumPerChanTemp = 1000;
                  AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
                  AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
                  DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
                  DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
                  DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
                  DAQStartTask(handles.Daq.AI_Handle);
                  DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
                  DAQStopTask(handles.Daq.AI_Handle);
                  AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
                  AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
                  for ii = 1:length(AI_AcqChannel) 
                      AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
                  end
                  AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
                  handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
               else
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
               end
               %%% AI configuration for acq
               AI_SampNumPerChan = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)*PixelNumTotal*length(handles.SLM.VortexChargeListAcq);
               AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
               AI_SampNumPerChanPerPixel = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate);
               AI_SampNumAllChanPerPixel = AI_SampNumPerChanPerPixel*length(AI_AcqChannel);
               AI_Data = zeros(AI_SampNumAllChan, 1); 
               AI_DataPerPixel = zeros(AI_SampNumAllChanPerPixel, 1); 
               DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle,'/PXI1Slot2/Ctr3InternalOutput', handles.Daq.AI_SampleRate, AI_SampNumPerChan);
               DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
               %%%%% AI SampClk configuration
               DAQSetCOPulseFreqInitialDelay(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, AI_SampClkInitDelayTime);
               DAQSetCOPulseFreq(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, handles.Daq.AI_SampleRate);
               DAQSetCOPulseDutyCyc(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 0.5);
               DAQCfgImplicitTimingFiniSamps(handles.Daq.AI_SampClkTD_Handle, round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate));
               DAQSetStartTrigType(handles.Daq.AI_SampClkTD_Handle, DAQmx_Val_DigEdge);
               DAQCfgDigEdgeStartTrig(handles.Daq.AI_SampClkTD_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
               DAQSetStartTrigRetriggerable(handles.Daq.AI_SampClkTD_Handle, 1);
               DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 1);
               %%%%% Start AI related tasks
               DAQStartTask(handles.Daq.AI_Handle);
               DAQStartTask(handles.Daq.AI_SampClkTD_Handle);
            else
            end
            %%%%% Start tasks
            DAQStartTask(handles.Daq.EomExcTrig_Handle);
            DAQStartTask(handles.Eom.AO_Handle);
            DAQStartTask(handles.Daq.PhotonCntrSampClk_Handle);
            DAQStartTask(handles.Daq.PhotonCntr_Handle);
            %%%%% Open shutter  
            handles.Daq.AcqShutterOpen();
            ShutterStatusDisp(hObject, eventdata, handles);
            AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
            %%%%% Acquire data
            for i = 1: PixelNumTotal
                waitbar((i-1)/PixelNumTotal,AcqWaitbar,sprintf('Acquiring Data for Pixel %d of %d !', i, PixelNumTotal)); 
                DAQWriteAnalogF64(handles.Galvo.AO_Handle, 2, 1, repmat(handles.Galvo.PO2Vol(i,:)',[2 1]));
                for j = 1: length(handles.SLM.VortexChargeListAcq)
                    %%% Set SLM display
                    handles.SLM.VortexCharge = handles.SLM.VortexChargeListAcq(j);
                    handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
                    hSLM_Gui = findobj('Name','SLM_Control');
                    hhSLM_Gui = guidata(hSLM_Gui);
                    hhSLM_Gui.SLM.VortexCharge = handles.SLM.VortexCharge;
                    hhSLM_Gui.SLM.Mask = handles.SLM.Mask;
                    set(hhSLM_Gui.popupmenu_VortexMaskCharge,'value',hhSLM_Gui.SLM.VortexCharge+1);
                    SLM_MaskDisp(hhSLM_Gui.axes_SLM_Mask,hhSLM_Gui.SLM.Mask);
                    handles.SLM.MaskProj();
                    pause(1);
                    %%% Start acq after the SLM mask stablizes
                    DAQStartTask(handles.Daq.PixelTrig_Handle);
                    %%% pause(PixelTrigWaitTime);
                    if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
                       PixelInd = (i-1)*length(handles.SLM.VortexChargeListAcq)+j; 
                       CI_Data((PixelInd-1)*CI_SampNumPerPixel+1:PixelInd*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);
                       AI_Data((PixelInd-1)*AI_SampNumAllChanPerPixel+1:PixelInd*AI_SampNumAllChanPerPixel,1) = DAQReadAnalogF64(handles.Daq.AI_Handle, AI_SampNumPerChanPerPixel, AI_DataPerPixel);
                    else
                       PixelInd = (i-1)*length(handles.SLM.VortexChargeListAcq)+j; 
                       CI_Data((PixelInd-1)*CI_SampNumPerPixel+1:PixelInd*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);
                    end
                    DAQWaitUntilTaskDone(handles.Daq.PixelTrig_Handle, -1);
                    DAQStopTask(handles.Daq.PixelTrig_Handle);
                end
                DAQWaitUntilTaskDone(handles.Galvo.AO_Handle, -1);
                DAQStopTask(handles.Galvo.AO_Handle); 
                waitbar(i/PixelNumTotal,AcqWaitbar,sprintf('Acquiring Data for Pixel %d of %d !', i, PixelNumTotal)); 
            end
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
               DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
               DAQStopTask(handles.Daq.AI_Handle);
               DAQStopTask(handles.Daq.AI_SampClkTD_Handle);
               close(AcqWaitbar);                
            else
               DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
               close(AcqWaitbar);                
            end
            %%%  Close shutter & stop tasks
            handles.Daq.AcqShutterClose();
            ShutterStatusDisp(hObject, eventdata, handles);
            DAQStopTask(handles.Daq.EomExcTrig_Handle);
            DAQStopTask(handles.Eom.AO_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            %%% Set Eom output to minimum
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
            DAQStopTask(handles.Eom.AO_Handle);
            %%% Reset start trigger & pixel trigger clk source
            DAQClearTask(handles.Daq.PixelTrig_Handle);  
            handles.Daq.PixelTrig_Handle = DAQCreateTask('PixelTrigger');
            DAQCreateCOPulseChanTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, '/PXI1Slot3/ao/SampleClock', 0, 100, 100);
            DAQSetRefClkSrc(handles.Daq.PixelTrig_Handle, '/PXI1Slot4/PXIe_Clk100');
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
            %%% Return to display vortex charge = 0 on SLM
            handles.SLM.VortexCharge = 0;
            handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
            hhSLM_Gui.SLM.VortexCharge = handles.SLM.VortexCharge;
            hhSLM_Gui.SLM.Mask = handles.SLM.Mask;
            set(hhSLM_Gui.popupmenu_VortexMaskCharge,'value',hhSLM_Gui.SLM.VortexCharge+1);
            SLM_MaskDisp(hhSLM_Gui.axes_SLM_Mask,hhSLM_Gui.SLM.Mask);
            handles.SLM.MaskProj();
            pause(1);
            guidata(hSLM_Gui,hhSLM_Gui);
            %%% Process and save data
            CI_DataTemp0 = reshape(CI_Data,[(GateNum+1) CI_TotalCycNum*length(handles.SLM.VortexChargeListAcq)])'; 
            %%% Process and save data
            if exist(handles.Daq.SavePath, 'dir')==7
            else
               SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
               mkdir('E:\Data\',SaveFolder);
               handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
            end
            datetimestr = datestr(now,'HHMMSS');
            StagesPara = obj2struct(handles.Stages);
            EomPara = obj2struct(handles.Eom);
            GalvoPara = obj2struct(handles.Galvo);
            DaqPara = obj2struct(handles.Daq);
            CameraPara = obj2struct(handles.Camera);
            SLM_Para = obj2struct(handles.SLM); 
            CI_PO2Pos = handles.Galvo.PO2Pos;
            CI_SurveyScanImg = handles.Daq.SurveyScanImg;
            for iii = 1:length(handles.SLM.VortexChargeListAcq)
                CI_DataProcessed = zeros(PixelNumTotal, GateNum);
                CI_DataSave = uint32(zeros(CI_TotalCycNum,GateNum));                
                for jjj = 1:PixelNumTotal
                    PixelInd = (jjj-1)*handles.Eom.NumCycles*length(handles.SLM.VortexChargeListAcq);
                    CI_Temp0 = CI_DataTemp0(PixelInd+(iii-1)*handles.Eom.NumCycles+1:PixelInd+iii*handles.Eom.NumCycles,:);
                    CI_Temp1 = diff(double(CI_Temp0),1,2);
                    CI_Temp1(find(CI_Temp1<0)) = 2^32-1+CI_Temp1(find(CI_Temp1<0));
                    CI_DataSave((jjj-1)*handles.Eom.NumCycles+1:jjj*handles.Eom.NumCycles,:) = CI_Temp1;
                    CI_DataProcessed(jjj,:) = sum(CI_Temp1,1);
                end
                %%% Save data and parameters
                if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
                   %%% Process AI data
                   AI_PixelStep = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate);
                   AI_DataSave = zeros(length(AI_AcqChannel), AI_PixelStep*PixelNumTotal);
                   for ppp = 1:length(AI_AcqChannel)
                       AI_DataTemp = AI_Data(ppp:length(AI_AcqChannel):end);
                       AI_DataTemp1 = reshape(AI_DataTemp,[AI_PixelStep PixelNumTotal*length(handles.SLM.VortexChargeListAcq)]);
                       AI_DataSave(ppp,:) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(ppp)+1)*reshape(AI_DataTemp1(:,iii:length(handles.SLM.VortexChargeListAcq):end),[1 AI_PixelStep*PixelNumTotal]);
                   end
                   if handles.Daq.BrainSurfaceSetStatus
                      Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                      Rel_Depth = max(Rel_Depth, 0);
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', 'G16L', num2str(handles.SLM.VortexChargeListAcq(iii)),'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
                   else
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', 'G16L', num2str(handles.SLM.VortexChargeListAcq(iii)),'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
                   end
                   save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg','AI_DataSave',...
                        'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara','CameraPara', 'SLM_Para');
                else
                   if handles.Daq.BrainSurfaceSetStatus
                      Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                      Rel_Depth = max(Rel_Depth, 0);
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_','G16L', num2str(handles.SLM.VortexChargeListAcq(iii)),'_',  datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
                   else
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_','G16L', num2str(handles.SLM.VortexChargeListAcq(iii)),'_',  datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
                   end
                   save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg',...
                        'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');                   
                end
            end
            DispSystStatus(handles, ['Data saved ' datetimestr]);
         end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 5  
    case 5        %%% pO2 Acq TD DeepTissueFast, 4 AO tasks: 2 Galvo 1 Eom 1 Fast Z; 1 CI task; Static FZ
         %%% Turn off photon counts monitor if it is on 
         if handles.Daq.PhotonCntsMoniStatus == 1 
            handles.Daq.PhotonCntsMoniStatus = 0;
            set(handles.radiobutton_PhotonCntsMoni,'value',0);
            set(handles.pushbutton_PhotonCntsMoni, 'BackgroundColor',[0.94 0.94 0.94]); 
            set(handles.text_PhotonCntsMoni,'string',' ');
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.PhotonCntr_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
         end
         %%%  Close accelerometer monitor if it is working
         if handles.Daq.AccelerMoniStatus == 1 
            handles.Daq.AccelerMoniStatus = 0;
            set(radiobutton_AccelerometerMoni,'value',0);
            set(handles.pushbutton_TestAcceler, 'BackgroundColor',[0.94 0.94 0.94]); 
            cla(handles.axes_CriticalDisplay);
            handles.CriticalDispMode = [1 0 0 0 0];
            set(handles.radiobutton_SelectCamera,'value',1);
            set(handles.text_SurveyScanColorbarMin,'Visible','On');
            set(handles.edit_SurveyScanColorbarMin,'Visible','On');
            set(handles.text_SurveyScanColorbarMax,'Visible','On');
            set(handles.edit_SurveyScanColorbarMax,'Visible','On'); 
            set(handles.text_PixelInfoCriticalDisp,'Visible','On');

            if ~isempty(timerfind)
               stop(timerfind);
               delete(timerfind);
            end
            DAQStopTask(handles.Daq.AI_Handle);
         end
         %%%  Close other possible timers
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         %%%  Configure para 
         if isempty(handles.Galvo.PO2Pos)| handles.SLM.UsageStatus~=1 
            DispSystStatus(handles, 'Target points not selected or SLM is not initialized!'); 
         else
            %%% Define variables 
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[1 0 0]);
            PixelNumTotal = size(handles.Galvo.PO2Pos,1)*handles.Daq.DaqRepeat;
            GateNum = floor(handles.Eom.ExcPeriod/handles.Daq.PhotonCntrRes);
            CI_SampNumPerPixel = (GateNum+1)*handles.Eom.NumCycles;
            CI_TotalSampNum = CI_SampNumPerPixel*PixelNumTotal;
            CI_TotalCycNum = handles.Eom.NumCycles*PixelNumTotal;
            CI_Data = uint32(zeros(CI_TotalSampNum,1));
            %%% Initial delay
            GalvoInitDelayTicks = 2;
            GalvoInertiaTicks = max(2, ceil(handles.Galvo.GalvoInertiaTime*handles.Galvo.AO_UpdateRate));
            PixelTrigInitDelayTicks = GalvoInertiaTicks + ceil(handles.Galvo.GalvoFlybackTime*handles.Galvo.AO_UpdateRate); 
            EomExcTrigDelayTime = 2e-8;
            EomInitDelayTicks = 2;
            CISampClkInitDelayTime = 2e-8 + 91e-8; %%% Eom input output delay is 910 ns for 3.3 MHz Eom AO updaterate
            %%% Configure tasks
            %%% AO task for Galvo
            SequenceSize = 2*size(handles.Galvo.WaveformX,1);
            GalvoWaveform = int16(zeros(SequenceSize,1));
            for i = 1:2:SequenceSize-1
                GalvoWaveform(i) = handles.Galvo.WaveformX((i+1)/2);
                GalvoWaveform(i+1) = handles.Galvo.WaveformY((i+1)/2);
            end
            GalvoWaveform = [GalvoWaveform; zeros(PixelTrigInitDelayTicks*2,1)]; 
            DAQCfgSampClkTimingFiniSamps(handles.Galvo.AO_Handle, ' ', handles.Galvo.AO_UpdateRate, size(handles.Galvo.WaveformX,1)+PixelTrigInitDelayTicks);
            DAQSetStartTrigType(handles.Galvo.AO_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Galvo.AO_Handle, '/PXI1Slot3/PFI1', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Galvo.AO_Handle, 1);
            DAQSetStartTrigDelayUnits(handles.Galvo.AO_Handle, DAQmx_Val_Ticks);
            DAQSetStartTrigDelay(handles.Galvo.AO_Handle, GalvoInitDelayTicks);
            DAQWriteBinaryI16(handles.Galvo.AO_Handle, size(handles.Galvo.WaveformX,1)+PixelTrigInitDelayTicks, 0, GalvoWaveform);         
            %%%%% PixelTrigger 
            PixelTickLength = handles.Galvo.PixelTotalLength;         
            PixelHighTickLength = round(0.2*handles.Galvo.PixelTotalLength); 
            PixelLowTickLength = PixelTickLength - PixelHighTickLength;
            DAQSetCOPulseTicksInitialDelay(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelTrigInitDelayTicks);
            DAQSetCOPulseHighTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelHighTickLength);
            DAQSetCOPulseLowTicks(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, PixelLowTickLength);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PixelTrig_Handle, PixelNumTotal);
            DAQSetStartTrigType(handles.Daq.PixelTrig_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.PixelTrig_Handle,'/PXI1Slot3/ao/StartTrigger', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.PixelTrig_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PixelTrig_Handle, handles.Daq.PixelTrigChannel, 1);
            %%% Eom Exc Trigger
            DAQSetCOPulseFreqInitialDelay(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, EomExcTrigDelayTime);
            DAQSetCOPulseFreq(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1/(handles.Eom.ExcPeriod+handles.Galvo.AcqDelayTime));
            DAQSetCOPulseDutyCyc(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 0.2);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.EomExcTrig_Handle, handles.Eom.NumCycles);
            DAQSetStartTrigType(handles.Daq.EomExcTrig_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.EomExcTrig_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.EomExcTrig_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.EomExcTrig_Handle, handles.Daq.EomExcTrigChannel, 1);
            %%%%% Eom AO task
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle, ' ', handles.Eom.AO_UpdateRate, size(handles.Eom.Waveform,1));
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Eom.AO_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 1);
            DAQSetStartTrigDelayUnits(handles.Eom.AO_Handle, DAQmx_Val_Ticks);
            DAQSetStartTrigDelay(handles.Eom.AO_Handle, EomInitDelayTicks);
            DAQWriteBinaryI16(handles.Eom.AO_Handle, size(handles.Eom.Waveform,1), 0, handles.Eom.Waveform);
            %%%%% Photon counter sample clock 
            DAQSetCOPulseFreqInitialDelay(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, CISampClkInitDelayTime);
            DAQSetCOPulseFreq(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1/handles.Daq.PhotonCntrRes);
            DAQSetCOPulseDutyCyc(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 0.5);
            DAQCfgImplicitTimingFiniSamps(handles.Daq.PhotonCntrSampClk_Handle, GateNum+1);
            DAQSetStartTrigType(handles.Daq.PhotonCntrSampClk_Handle, DAQmx_Val_DigEdge);
            DAQCfgDigEdgeStartTrig(handles.Daq.PhotonCntrSampClk_Handle,'/PXI1Slot3/Ctr3InternalOutput', DAQmx_Val_Rising);
            DAQSetStartTrigRetriggerable(handles.Daq.PhotonCntrSampClk_Handle, 1);
            DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.PhotonCntrSampClk_Handle, handles.Daq.PhotonCntrSampClk, 1);
            %%%%% PhotonCntr 
            DAQCfgSampClkTimingFiniSamps(handles.Daq.PhotonCntr_Handle,'/PXI1Slot3/Ctr1InternalOutput', 1e6, CI_TotalSampNum);              
            %%%%% AI task for Pos+Accelerometer recording
            if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
               DAQClearTask(handles.Daq.AI_Handle);
               handles.Daq.AI_Handle = DAQCreateTask('DaqAI');
               DAQCreateAIVoltageChan(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', [-5 5]);
               DAQSetRefClkSrc(handles.Daq.AI_Handle, '/PXI1Slot2/PXIe_Clk100');
               DAQSetAICoupling(handles.Daq.AI_Handle, '/PXI1Slot2/ai0:7', DAQmx_Val_DC);
            
               AI_SampClkInitDelayTime = 2e-8 + CISampClkInitDelayTime;
               AI_InitDelayTime = 2e-8;
               AI_AcqChannel = find(handles.Daq.AI_ActiveChannel,3,'first')-1;
               AI_ReadChannel = ' ';
               for i = 1: length(AI_AcqChannel)
                   ActiveChannel = ['PXI1Slot2/ai', num2str(AI_AcqChannel(i))];
                   if i ~= length(AI_AcqChannel)
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel, ',');
                   else
                      AI_ReadChannel = strcat(AI_ReadChannel, ActiveChannel);   
                   end
                   DAQSetAIMin(handles.Daq.AI_Handle, ActiveChannel, -handles.Daq.AI_Range(AI_AcqChannel(i)+1));
                   DAQSetAIMax(handles.Daq.AI_Handle, ActiveChannel, handles.Daq.AI_Range(AI_AcqChannel(i)+1));
               end
               DAQSetReadChannelsToRead(handles.Daq.AI_Handle, AI_ReadChannel);   
               %%% Read offset of Pre-amps
               if any(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1) == 1)
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1);
                  AI_SampNumPerChanTemp = 1000;
                  AI_SampNumAllChanTemp = AI_SampNumPerChanTemp*length(AI_AcqChannel);
                  AI_OffsetTemp1 = zeros(AI_SampNumAllChanTemp, 1);
                  DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle, ' ', handles.Daq.AI_SampleRate, AI_SampNumPerChanTemp);
                  DAQSetStartTrigRetriggerable(handles.Daq.AI_Handle, 0);
                  DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
                  DAQStartTask(handles.Daq.AI_Handle);
                  DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
                  DAQStopTask(handles.Daq.AI_Handle);
                  AI_OffsetTemp1 = DAQReadBinaryI16(handles.Daq.AI_Handle, AI_SampNumPerChanTemp, AI_OffsetTemp1);
                  AI_OffsetTemp2 = zeros(length(AI_AcqChannel),AI_SampNumPerChanTemp);
                  for ii = 1:length(AI_AcqChannel) 
                      AI_OffsetTemp2(ii,:) = AI_OffsetTemp1(ii:length(AI_AcqChannel):end);
                  end
                  AI_OffsetTemp3 = round(mean(AI_OffsetTemp2,2));
                  handles.Daq.AI_Offset(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1)) = AI_OffsetTemp3(find(handles.Daq.AI_OffsetSubFlag(AI_AcqChannel+1)==1));
               else
                  handles.Daq.AI_Offset = zeros(length(AI_AcqChannel),1); 
               end
               %%% AI configuration for acq
               AI_SampNumPerChan = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate)*PixelNumTotal;
               AI_SampNumAllChan = AI_SampNumPerChan*length(AI_AcqChannel);
               AI_SampNumPerChanPerPixel = round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate);
               AI_SampNumAllChanPerPixel = AI_SampNumPerChanPerPixel*length(AI_AcqChannel);
               AI_Data = zeros(AI_SampNumAllChan, 1); 
               AI_DataPerPixel = zeros(AI_SampNumAllChanPerPixel, 1); 
               DAQCfgSampClkTimingFiniSamps(handles.Daq.AI_Handle,'/PXI1Slot2/Ctr3InternalOutput', handles.Daq.AI_SampleRate, AI_SampNumPerChan);
               DAQSetStartTrigType(handles.Daq.AI_Handle, DAQmx_Val_None);
               %%%%% AI SampClk configuration
               DAQSetCOPulseFreqInitialDelay(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, AI_SampClkInitDelayTime);
               DAQSetCOPulseFreq(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, handles.Daq.AI_SampleRate);
               DAQSetCOPulseDutyCyc(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 0.5);
               DAQCfgImplicitTimingFiniSamps(handles.Daq.AI_SampClkTD_Handle, round(handles.Daq.PixelDwellTime*handles.Daq.AI_SampleRate));
               DAQSetStartTrigType(handles.Daq.AI_SampClkTD_Handle, DAQmx_Val_DigEdge);
               DAQCfgDigEdgeStartTrig(handles.Daq.AI_SampClkTD_Handle,'/PXI1Slot4/Ctr3InternalOutput', DAQmx_Val_Rising);
               DAQSetStartTrigRetriggerable(handles.Daq.AI_SampClkTD_Handle, 1);
               DAQSetCOEnableInitialDelayOnRetrigger(handles.Daq.AI_SampClkTD_Handle, handles.Daq.AI_SampClkTD_Channel, 1);
            end
            %%% Start Daq tasks and wait for start trigger
            DAQStartTask(handles.Galvo.AO_Handle); 
            DAQStartTask(handles.Daq.PixelTrig_Handle);
            DAQStartTask(handles.Daq.EomExcTrig_Handle);
            DAQStartTask(handles.Eom.AO_Handle);
            DAQStartTask(handles.Daq.PhotonCntrSampClk_Handle);
            %%%%% Open shutter 
            handles.Daq.AcqShutterOpen();
            ShutterStatusDisp(hObject, eventdata, handles);
            AcqWaitbar = waitbar(0,'Acquiring Data !','Name','Data acquisition progress');
            %%%%% Switch SLM masks for data acquisition
            for Vortexchargeindex = 1:length(handles.SLM.VortexChargeListAcq)
                if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
                   %%% Start AI related tasks
                   DAQStartTask(handles.Daq.AI_Handle);
                   DAQStartTask(handles.Daq.AI_SampClkTD_Handle);
                end
                %%% Set SLM display
                handles.SLM.VortexCharge = handles.SLM.VortexChargeListAcq(Vortexchargeindex);
                handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
                hSLM_Gui = findobj('Name','SLM_Control');
                hhSLM_Gui = guidata(hSLM_Gui);
                hhSLM_Gui.SLM.VortexCharge = handles.SLM.VortexCharge;
                hhSLM_Gui.SLM.Mask = handles.SLM.Mask;
                set(hhSLM_Gui.popupmenu_VortexMaskCharge,'value',hhSLM_Gui.SLM.VortexCharge+1);
                SLM_MaskDisp(hhSLM_Gui.axes_SLM_Mask,hhSLM_Gui.SLM.Mask);
                handles.SLM.MaskProj();
                pause(1);
                %%%%% Start Daq tasks 
                DAQStartTask(handles.Daq.PhotonCntr_Handle);
                waitbar(0,AcqWaitbar,sprintf('Acquiring Data for Vortex charge %d !', handles.SLM.VortexChargeListAcq(Vortexchargeindex)));              
                DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 1); 
                %%%%% Acquire data
                if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
                   for iii = 1: PixelNumTotal
                       CI_Data((iii-1)*CI_SampNumPerPixel+1:iii*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);  
                       AI_Data((iii-1)*AI_SampNumAllChanPerPixel+1:iii*AI_SampNumAllChanPerPixel,1) = DAQReadAnalogF64(handles.Daq.AI_Handle, AI_SampNumPerChanPerPixel, AI_DataPerPixel);
                       waitbar(iii/PixelNumTotal,AcqWaitbar,sprintf('Acquiring Data for Vortex charge %d !', handles.SLM.VortexChargeListAcq(Vortexchargeindex))); 
                   end
                   DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
                   DAQWaitUntilTaskDone(handles.Daq.AI_Handle, -1);
                   DAQStopTask(handles.Daq.AI_Handle);
                   DAQStopTask(handles.Daq.AI_SampClkTD_Handle);
                else
                   for iii = 1: PixelNumTotal
                       CI_Data((iii-1)*CI_SampNumPerPixel+1:iii*CI_SampNumPerPixel,1) = DAQReadCounterU32(handles.Daq.PhotonCntr_Handle, CI_SampNumPerPixel);  
                       waitbar(iii/PixelNumTotal,AcqWaitbar,sprintf('Acquiring Data for Vortex charge %d !', handles.SLM.VortexChargeListAcq(Vortexchargeindex))); 
                   end
                   DAQWaitUntilTaskDone(handles.Daq.PhotonCntr_Handle, -1);
                end
                %%% Reset start trigger
                DAQStopTask(handles.Daq.PhotonCntr_Handle);
                DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0);
                %%% Process and save data
                CI_DataTemp0 = reshape(CI_Data,[(GateNum+1) CI_TotalCycNum])';
                CI_DataSave = uint32(zeros(CI_TotalCycNum,GateNum));
                CI_DataProcessed = zeros(PixelNumTotal, GateNum);
                CI_Temp1 = diff(double(CI_DataTemp0),1,2);
                CI_Temp1(find(CI_Temp1<0)) = 2^32-1+CI_Temp1(find(CI_Temp1<0));
                CI_DataSave = CI_Temp1;
                for jjj = 1: PixelNumTotal
                    CI_Temp2 = CI_Temp1((jjj-1)*handles.Eom.NumCycles+1:jjj*handles.Eom.NumCycles,:); 
                    CI_DataProcessed(jjj,:) = sum(CI_Temp2,1);
                end
                CI_PO2Pos = handles.Galvo.PO2Pos;
                CI_SurveyScanImg = handles.Daq.SurveyScanImg;
                %%% Save data and parameters
                if ~isempty(find(handles.Daq.AI_ActiveChannel,3,'first'))
                   if exist(handles.Daq.SavePath, 'dir')==7
                   else
                      SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                      mkdir('E:\Data\',SaveFolder);
                      handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
                   end
                   AI_DataSave = zeros(length(AI_AcqChannel), AI_SampNumPerChan);
                   for iii = 1:length(AI_AcqChannel)
                       AI_DataSave(iii,:) = (-1)^handles.Daq.AI_InverseChannel(AI_AcqChannel(iii)+1)*AI_Data(iii:length(AI_AcqChannel):end);
                   end
                   %%% Save mat and para 
                   datetimestr = datestr(now,'HHMMSS');
                   StagesPara = obj2struct(handles.Stages);
                   EomPara = obj2struct(handles.Eom);
                   GalvoPara = obj2struct(handles.Galvo);
                   DaqPara = obj2struct(handles.Daq);
                   CameraPara = obj2struct(handles.Camera);
                   SLM_Para = obj2struct(handles.SLM); 
                   if handles.Daq.BrainSurfaceSetStatus
                      Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                      Rel_Depth = max(Rel_Depth, 0);
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', 'G16L', num2str(handles.SLM.VortexCharge),'_', datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
                   else
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_', 'G16L', num2str(handles.SLM.VortexCharge),'_', datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
                   end
                   save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg','AI_DataSave',...
                        'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara','CameraPara', 'SLM_Para');
                else
                   if exist(handles.Daq.SavePath, 'dir')==7
                   else
                      SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')]; 
                      mkdir('E:\Data\',SaveFolder);
                      handles.Daq.SavePath = ['E:\Data\',SaveFolder,'\'];
                   end
                   %%% Save mat and para 
                   datetimestr = datestr(now,'HHMMSS');
                   StagesPara = obj2struct(handles.Stages);
                   EomPara = obj2struct(handles.Eom);
                   GalvoPara = obj2struct(handles.Galvo);
                   DaqPara = obj2struct(handles.Daq);
                   CameraPara = obj2struct(handles.Camera);
                   SLM_Para = obj2struct(handles.SLM); 
                   if handles.Daq.BrainSurfaceSetStatus
                      Rel_Depth =  (handles.Daq.BrainSurfacePosZ(1)- handles.Stages.CurrentPos(3)) + (handles.Stages.CurrentPos(4) - handles.Daq.BrainSurfacePosZ(2));
                      Rel_Depth = max(Rel_Depth, 0);
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_','G16L', num2str(handles.SLM.VortexCharge),'_',  datetimestr, '_', num2str(round(Rel_Depth)),'um_Pial.mat'];               
                   else
                      Savenamemat = [handles.Daq.SavePath, handles.Daq.SaveFilename,'_','G16L', num2str(handles.SLM.VortexCharge),'_',  datetimestr, '_', num2str(round(abs(handles.Stages.CurrentPos(4)))),'um.mat'];               
                   end
                   save(Savenamemat,'CI_DataSave','CI_DataProcessed','CI_PO2Pos','CI_SurveyScanImg',...
                        'StagesPara', 'EomPara', 'GalvoPara', 'DaqPara', 'CameraPara', 'SLM_Para');
                end
                DispSystStatus(handles, ['Data saved ' datetimestr]);
            end
            %%% Close shutter & stop tasks
            close(AcqWaitbar);
            handles.Daq.AcqShutterClose();
            ShutterStatusDisp(hObject, eventdata, handles);
            DAQStopTask(handles.Galvo.AO_Handle);
            DAQStopTask(handles.Daq.PixelTrig_Handle);
            DAQStopTask(handles.Daq.EomExcTrig_Handle);
            DAQStopTask(handles.Eom.AO_Handle);
            DAQStopTask(handles.Daq.PhotonCntrSampClk_Handle);
            %%% Set Eom output to minimum
            DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
            DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
            DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
            DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
            DAQStopTask(handles.Eom.AO_Handle);
            %%% Reset start trigger & Galvo retrigger property 
            set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
            %%% Return to display vortex charge = 0 on SLM
            handles.SLM.VortexCharge = 0;
            handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
            hhSLM_Gui.SLM.VortexCharge = handles.SLM.VortexCharge;
            hhSLM_Gui.SLM.Mask = handles.SLM.Mask;
            set(hhSLM_Gui.popupmenu_VortexMaskCharge,'value',hhSLM_Gui.SLM.VortexCharge+1);
            SLM_MaskDisp(hhSLM_Gui.axes_SLM_Mask,hhSLM_Gui.SLM.Mask);
            handles.SLM.MaskProj();
            pause(1);
            guidata(hSLM_Gui,hhSLM_Gui);
         end
end
%%% Save handles
guidata(hObject, handles);

%%% Stop data acquisition
function pushbutton_StopAcquisition_Callback(hObject, eventdata, handles)
%%% Close all shutters
handles.Daq.Shutter0_Close();
if handles.Daq.Shutter0_SilenceStatus
   handles.Daq.Shutter0_SilenceStatus = 0;
   set(handles.pushbutton_SilenceShutterMain,'BackgroundColor',[0.94 0.94 0.94]);
end
handles.Daq.Shutter1_Close();
handles.Daq.Shutter2_Close();
ShutterStatusDisp(hObject, eventdata, handles);
%%% Reset start trigger
DAQWriteDigitalLines(handles.Daq.StartTrig_Handle, 0); 
set(handles.pushbutton_StartAcquisition,'BackgroundColor',[0.94 0.94 0.94]);
%%% Update Eom Output
if handles.Eom.LaserOutStatus == 1
   if any(handles.Daq.DaqMode == [0 1])
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   else
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0); 
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   end
else
   DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
   DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
   DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
   DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
   DAQStopTask(handles.Eom.AO_Handle);
end
%%% Save handles
guidata(hObject, handles);

%%% Set DaqMode
function popupmenu_DaqMode_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu_DaqMode,'value')-1;
switch val
    case 0   %%% Angio SurveyScan
       handles.Daq.DaqMode = 0;  
       DaqMode0_Config(hObject, eventdata, handles);
       %%% Update Eom Output
       if handles.Eom.LaserOutStatus == 1
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       else
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       end
    case 1   %%%  Angio Acquisition
       handles.Daq.DaqMode = 1;        
       DaqMode1_Config(hObject, eventdata, handles);
       %%% Update Eom Output
       if handles.Eom.LaserOutStatus == 1
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       else
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       end
    case 2   %%%  pO2 SurveyScan
       handles.Daq.DaqMode = 2;
       DaqMode2_Config(hObject, eventdata, handles);      
       %%%  Update Eom output
       DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
       DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
       DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
       DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
       DAQStopTask(handles.Eom.AO_Handle);
    case 3   %%% pO2 Acquisition Galvo TD
       if ~isempty(handles.Daq.SurveyScanImg) & ~isempty(handles.Galvo.PO2Pos)
          handles.Daq.DaqMode = 3;       
          DaqMode3_Config(hObject, eventdata, handles);
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       else %%% Switch to PO2 SurveryScan if no SurveyScan is saved 
          handles.Daq.DaqMode = 2;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode2_Config(hObject, eventdata, handles);      
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       end
    case 4   %%% Switch to pO2 Acquisition TD DeepTissueSlow
       if ~isempty(handles.Daq.SurveyScanImg) & ~isempty(handles.Galvo.PO2Pos)...
          & handles.SLM.UsageStatus==1 
          handles.Daq.DaqMode = 4;       
          DaqMode4_Config(hObject, eventdata, handles);
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       else %%% Switch to PO2 SurveryScan if no SurveyScan is saved 
          handles.Daq.DaqMode = 2;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode2_Config(hObject, eventdata, handles);      
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       end
    case 5   %%% Switch to pO2 Acquisition TD DeepTissueFast
       if ~isempty(handles.Daq.SurveyScanImg) & ~isempty(handles.Galvo.PO2Pos)...
          & handles.SLM.UsageStatus==1 
          handles.Daq.DaqMode = 5;       
          DaqMode5_Config(hObject, eventdata, handles);
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       else %%% Switch to PO2 SurveryScan if no SurveyScan is saved 
          handles.Daq.DaqMode = 2;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode2_Config(hObject, eventdata, handles);      
          %%%  Update Eom output
          DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
          DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
          DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
          DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
          DAQStopTask(handles.Eom.AO_Handle);
       end
end
%%% Update Savename
handles.Daq.SaveFilename = handles.Daq.SaveFilenameList{handles.Daq.DaqMode+1};
set(handles.edit_SaveFilename,'string',handles.Daq.SaveFilename);
%%% Update Galvo waveform
handles.Galvo.GenerateWaveform(handles.Daq.DaqMode, handles.Daq.DaqRepeat, handles.Daq.AI_SampleRate); 
handles.Galvo.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
%%% Update Eom waveform
handles.Eom.GenerateWaveform(handles.Daq.DaqMode);
handles.Eom.DisplayWaveform(handles.axes_Eom, handles.Daq.DaqMode);
%%% Update FrameRate & FZ waveform
handles.Daq.FrameRate = 1/handles.Galvo.FrameLength*handles.Galvo.AO_UpdateRate;   
set(handles.text_FrameRate,'string', num2str(handles.Daq.FrameRate));
handles.Stages.GenerateWaveformFZ(handles.Daq.StackInfo, handles.Daq.FrameRate, handles.Daq.DaqMode);
handles.Stages.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
%%% Save handles
guidata(hObject, handles);

%%% DaqMode configuration-Force change of modes only, for parameter loading 
function DaqModeConfig_ForceModeChanOnly(hObject, eventdata, handles)
switch handles.Daq.DaqMode
    case 0
       %%% Set Modes
       handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 
       set(handles.radiobutton_RasterScan,'value', 1);
       handles.Eom.PowerMode = 0;      % 0: CW ; 1: TD Gated; 
       set(handles.radiobutton_CW,'value', 1);
       handles.Daq.DaqStatus = 0;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_SurveyScan,'value', 1);
    case 1 
       %%% Set Modes
       handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 
       set(handles.radiobutton_RasterScan,'value', 1);
       handles.Eom.PowerMode = 0;      % 0: CW ; 1: TD Gated; 
       set(handles.radiobutton_CW,'value', 1);
       handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_Acquisition,'value', 1);        
    case 2
       %%% Set Modes
       handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 
       set(handles.radiobutton_RasterScan,'value', 1);
       handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 
       set(handles.radiobutton_Gated,'value', 1);
       handles.Daq.DaqStatus = 0;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_SurveyScan,'value', 1);
    case 3 
       %%% Set Modes
       handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts  
       set(handles.radiobutton_MultiPointsGalvo,'value', 1);
       handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated;
       set(handles.radiobutton_Gated,'value', 1);
       handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_Acquisition,'value', 1);     
    case 4
       %%% Set Modes
       handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts 
       set(handles.radiobutton_MultiPointsGalvo,'value', 1);
       handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated;
       set(handles.radiobutton_Gated,'value', 1);
       handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_Acquisition,'value', 1);   
    case 5 
       %%% Set Modes
       handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts 
       set(handles.radiobutton_MultiPointsGalvo,'value', 1);
       handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 
       set(handles.radiobutton_Gated,'value', 1);
       handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
       set(handles.radiobutton_Acquisition,'value', 1); 
end
%%% Save handles
guidata(hObject, handles);

%%% DaqMode configuration
function DaqModeConfig(hObject, eventdata, handles)
DaqModeChangeFlag = 0;
switch handles.Galvo.ScanMode     % 0: Scan; 1: Galvo Multi-Pts 
    case 0
       if handles.Eom.PowerMode == 0 % 0: CW ; 1: TD Gated; 
          if handles.Daq.DaqStatus == 0 % 0: SurveyScan 1: Acq Stack
             if handles.Daq.DaqMode == 0 
                DaqModeChangeFlag = 0; 
             else
                DaqModeChangeFlag = 1; 
                TarDaqMode = 0; 
             end
          else %%% 1: Acq Stack
             if handles.Daq.DaqMode == 1 
                DaqModeChangeFlag = 0; 
             else
                DaqModeChangeFlag = 1; 
                TarDaqMode = 1; 
             end
          end
       else %%% handles.Eom.PowerMode == 1   %%% 0: CW; 1: TD Gated;   
          if handles.Daq.DaqMode == 2
             DaqModeChangeFlag = 0;
          else
             %%% 2: pO2 SurveyScan
             DaqModeChangeFlag = 1; 
             TarDaqMode = 2;  
          end
       end
    case 1            %0: Scan; 1: Galvo Multi-Pts
       if handles.Eom.PowerMode == 0   %%% 0: CW ; 1: TD Gated; 
          %%% Switch to pO2 SurveyScan   
          DaqModeChangeFlag = 1;
          TarDaqMode = 2;
       else %%% handles.Eom.PowerMode == 1   %%% 0: CW ; 1: TD Gated; 
          if ~isempty(handles.Daq.SurveyScanImg) & ~isempty(handles.Galvo.PO2Pos)
             if any(handles.Daq.DaqMode == [3:5])
                DaqModeChangeFlag = 0;
             else     
                %%% Switch to pO2 TD Acq
                DaqModeChangeFlag = 1;
                TarDaqMode = 3;
             end
          else
             %%% Switch to pO2 SurveyScan
             DaqModeChangeFlag = 1; 
             TarDaqMode = 2;
          end
       end
end
if DaqModeChangeFlag == 1  %%%% DaqMode changes
   handles.Daq.DaqMode = TarDaqMode;  
   switch handles.Daq.DaqMode
       case 0
          %%% Angiogram SurveyScan
          handles.Daq.DaqMode = 0;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode0_Config(hObject, eventdata, handles);
       case 1
          %%% Angiogram Stack Acq
          handles.Daq.DaqMode = 1;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode1_Config(hObject, eventdata, handles); 
       case 2
          %%% pO2 SurveyScan Galvo
          handles.Daq.DaqMode = 2;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
          DaqMode2_Config(hObject, eventdata, handles);
       case 3
          %%% pO2 Acq Galvo TD
          handles.Daq.DaqMode = 3;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1); 
          DaqMode3_Config(hObject, eventdata, handles);
       case 4
          %%% Switch to pO2 Acquisition TD DeepTissueSlow
          handles.Daq.DaqMode = 4;
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1); 
          DaqMode4_Config(hObject, eventdata, handles);
       case 5
          %%% Switch to pO2 Acquisition TD DeepTissueFast
          handles.Daq.DaqMode = 5;  
          set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1); 
          DaqMode5_Config(hObject, eventdata, handles);
   end 
   %%% Update Savename
   handles.Daq.SaveFilename = handles.Daq.SaveFilenameList{handles.Daq.DaqMode+1};
   set(handles.edit_SaveFilename,'string',handles.Daq.SaveFilename);
   %%% Update Galvo waveform
   handles.Galvo.GenerateWaveform(handles.Daq.DaqMode, handles.Daq.DaqRepeat, handles.Daq.AI_SampleRate); 
   handles.Galvo.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
   %%% Update Eom waveform
   handles.Eom.GenerateWaveform(handles.Daq.DaqMode);
   handles.Eom.DisplayWaveform(handles.axes_Eom, handles.Daq.DaqMode);
   %%% Update FrameRate & FZ waveform
   handles.Daq.FrameRate = 1/handles.Galvo.FrameLength*handles.Galvo.AO_UpdateRate;   
   set(handles.text_FrameRate,'string', num2str(handles.Daq.FrameRate));
   handles.Stages.GenerateWaveformFZ(handles.Daq.StackInfo, handles.Daq.FrameRate, handles.Daq.DaqMode);
   handles.Stages.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
else  %%%% DaqMode does not change
   %%% Update Galvo time
   UpdateGalvoTime(hObject, eventdata, handles);
   %%% Update Galvo waveform
   handles.Galvo.GenerateWaveform(handles.Daq.DaqMode, handles.Daq.DaqRepeat, handles.Daq.AI_SampleRate); 
   handles.Galvo.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
   %%% Update Eom waveform
   handles.Eom.GenerateWaveform(handles.Daq.DaqMode);
   handles.Eom.DisplayWaveform(handles.axes_Eom, handles.Daq.DaqMode);
   %%% Update FrameRate & FZ waveform
   handles.Daq.FrameRate = 1/handles.Galvo.FrameLength*handles.Galvo.AO_UpdateRate;   
   set(handles.text_FrameRate,'string', num2str(handles.Daq.FrameRate));
   handles.Stages.GenerateWaveformFZ(handles.Daq.StackInfo, handles.Daq.FrameRate, handles.Daq.DaqMode);
   handles.Stages.DisplayWaveform(handles.axes_Galvo_FZ_Wav, handles.Daq.DaqMode);
end
%%% Update Eom Output
if handles.Eom.LaserOutStatus == 1
   if any(handles.Daq.DaqMode == [0 1])
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.PeakVoltage*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   else
      DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
      DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
      DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
      DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
      DAQStopTask(handles.Eom.AO_Handle);
   end
else
   DAQSetStartTrigRetriggerable(handles.Eom.AO_Handle, 0);
   DAQSetStartTrigType(handles.Eom.AO_Handle, DAQmx_Val_None);
   DAQCfgSampClkTimingFiniSamps(handles.Eom.AO_Handle,' ',1e6, 2);
   DAQWriteAnalogF64(handles.Eom.AO_Handle, 2, 1, handles.Eom.VoltMiniInput*ones(2,1));
   DAQStopTask(handles.Eom.AO_Handle);
end
%%% Save handles
guidata(hObject, handles);

%%% DaqMode0 Configuration: Angiogram SurveyScan
function DaqMode0_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts 
set(handles.radiobutton_RasterScan,'value', 1);
handles.Eom.PowerMode = 0;      % 0: CW ; 1: TD Gated; 2: Sin; 3: Squ
set(handles.radiobutton_CW,'value', 1);
handles.Daq.DaqStatus = 0;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_SurveyScan,'value', 1);
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set PixelNum
handles.Galvo.PixelX = 512;
handles.Galvo.PixelY = 512;
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set SampleRate & UpdateRate
handles.Daq.AI_SampleRate = 1e6;
handles.Galvo.AO_UpdateRate = 5e5;
if handles.Daq.PixelDwellTime >= 900e-6
   handles.Daq.PixelDwellTime = 4e-6;
   handles.Daq.SamplePerPx = 4;
else
   handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
   handles.Daq.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
end
handles.Eom.PixelDwellTime = handles.Daq.PixelDwellTime;
handles.Galvo.PixelDwellTime = handles.Daq.PixelDwellTime;
handles.Galvo.AcqDelayTime = 143.55e-6;
%%% Set Display
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
%%% Set AI_ActiveChannel 
handles.Daq.CI_ActiveStatus = 0;
if any(handles.Daq.AI_ActiveChannel)
else
   handles.Daq.AI_ActiveChannel(3:5)= 1; 
end
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);

%%% DaqMode1 Configuration: Angiogram Stack Acq
function DaqMode1_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts 
set(handles.radiobutton_RasterScan,'value', 1);
handles.Eom.PowerMode = 0;      % 0: CW ; 1: TD Gated; 2: Sin; 3: Squ
set(handles.radiobutton_CW,'value', 1);
handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_Acquisition,'value', 1);
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set PixelNum                
handles.Galvo.PixelX = 512;
handles.Galvo.PixelY = 512;
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set SampleRate & UpdateRate
handles.Daq.AI_SampleRate = 1e6;
handles.Galvo.AO_UpdateRate = 5e5;
if handles.Daq.PixelDwellTime >= 900e-6
   handles.Daq.PixelDwellTime = 4e-6;
   handles.Daq.SamplePerPx = 4;
else
   handles.Daq.SamplePerPx = max(ceil(handles.Daq.SamplePerPx/2)*2,2);
   handles.Daq.PixelDwellTime = handles.Daq.SamplePerPx/handles.Daq.AI_SampleRate;
end
handles.Eom.PixelDwellTime = handles.Daq.PixelDwellTime;
handles.Galvo.PixelDwellTime = handles.Daq.PixelDwellTime;
handles.Galvo.AcqDelayTime = 143.55e-6;
%%% Set Display
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
%%% Set AI_ActiveChannel 
handles.Daq.CI_ActiveStatus = 0;
if any(handles.Daq.AI_ActiveChannel)
else
   handles.Daq.AI_ActiveChannel(3:5)= 1; 
end
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Set DataSave Status
handles.Daq.SaveStatus = 1;
set(handles.radiobutton_SaveStatus,'Value', handles.Daq.SaveStatus);
%%% Save handles
guidata(hObject, handles);
    
%%% DaqMode2 Configuration: pO2 SurveyScan 
function DaqMode2_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 0;     % 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts 
set(handles.radiobutton_RasterScan,'value', 1);
handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 2: Sin; 3: Squ
set(handles.radiobutton_Gated,'value', 1);
handles.Daq.DaqStatus = 0;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_SurveyScan,'value', 1);
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set PixelNum
handles.Galvo.PixelX = 250;
handles.Galvo.PixelY = 250;
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set Eom Timing
handles.Eom.ExcPeriod = 300e-6;
handles.Eom.GateWidth = 10e-6;
set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
if handles.Eom.NumCycles > 10
   handles.Eom.NumCycles = 1;       
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
else
   handles.Eom.NumCycles = max(handles.Eom.NumCycles,1); 
end
handles.Galvo.AO_UpdateRate = 5e4;
handles.Galvo.AcqDelayTime = 10e-6;
%%% handles.Eom.PixelDwellTime = handles.Eom.ExcPeriod*handles.Eom.NumCycles;
handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
handles.Galvo.NumCycles = handles.Eom.NumCycles;
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;

set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
set(handles.edit_GalvoAO_UpdateRate,'string', num2str(handles.Galvo.AO_UpdateRate));
%%% Set Daq parameters
handles.Daq.PhotonCntrRes = 2e-6;
set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));  
%%% handles.Daq.AI_SampleRate = 8e3;
handles.Daq.AI_SampleRate = 4e4;
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
handles.Daq.DaqRepeat = 1;
set(handles.edit_DaqRepeat,'string',num2str(handles.Daq.DaqRepeat));
%%% Set AI_ActiveChannel  
handles.Daq.CI_ActiveStatus = 1;
handles.Daq.AI_ActiveChannel([3:5]) = 0;
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Save handles
guidata(hObject, handles);
       
%%% DaqMode3 Configuration: pO2 Acq_Galvo_TD   
function DaqMode3_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts 
set(handles.radiobutton_MultiPointsGalvo,'value', 1);
handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 2: Sin; 3: Squ
set(handles.radiobutton_Gated,'value', 1);
handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_Acquisition,'value', 1);   
%%% Set PixelNum
handles.Galvo.PixelX = size(handles.Daq.SurveyScanImg,2);
handles.Galvo.PixelY = size(handles.Daq.SurveyScanImg,1);
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set Eom Timing
handles.Eom.ExcPeriod = 300e-6;
handles.Eom.GateWidth = 10e-6;
set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
if handles.Eom.NumCycles < 600
   handles.Eom.NumCycles = 2000;       
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
else
end
handles.Galvo.AO_UpdateRate = 5e4;
handles.Galvo.AcqDelayTime = 10e-6;
handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
handles.Galvo.NumCycles = handles.Eom.NumCycles;
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;

set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
set(handles.edit_GalvoAO_UpdateRate,'string', num2str(handles.Galvo.AO_UpdateRate));
%%% Set Daq parameters
handles.Daq.PhotonCntrRes = 2e-6;
set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
handles.Daq.AI_SampleRate = 1e3;
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
%%% Set AI_ActiveChannel 
handles.Daq.CI_ActiveStatus = 1;
handles.Daq.AI_ActiveChannel([3:5]) = 0;
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Set DataSave Status
handles.Daq.SaveStatus = 1;
set(handles.radiobutton_SaveStatus,'Value', handles.Daq.SaveStatus);
%%% Save handles
guidata(hObject, handles);
       
%%% DaqMode4 Configuration: pO2 Acq_TD_DeepTissueSlow (SLM and Galvo Multi-Pts are used)   
function DaqMode4_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts 
set(handles.radiobutton_MultiPointsGalvo,'value', 1);
handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 
set(handles.radiobutton_Gated,'value', 1);
handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_Acquisition,'value', 1);   
%%% Set PixelNum
handles.Galvo.PixelX = size(handles.Daq.SurveyScanImg,2);
handles.Galvo.PixelY = size(handles.Daq.SurveyScanImg,1);
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set Eom Timing
handles.Eom.ExcPeriod = 300e-6;
handles.Eom.GateWidth = 10e-6;
set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
if handles.Eom.NumCycles <1000
   handles.Eom.NumCycles = 2000;       
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
else
end
handles.Galvo.AO_UpdateRate = 5e4;
handles.Galvo.AcqDelayTime = 10e-6;
%%% handles.Eom.PixelDwellTime = handles.Eom.ExcPeriod*handles.Eom.NumCycles;
handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
handles.Galvo.NumCycles = handles.Eom.NumCycles;
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;

set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
set(handles.edit_GalvoAO_UpdateRate,'string', num2str(handles.Galvo.AO_UpdateRate));
%%% Set Daq parameters
handles.Daq.PhotonCntrRes = 2e-6;
set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
handles.Daq.AI_SampleRate = 1e3;
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));   
%%% Set AI_ActiveChannel  
handles.Daq.CI_ActiveStatus = 1;
handles.Daq.AI_ActiveChannel([3:5]) = 0;
%%% handles.Daq.AI_ActiveChannel(1+1) = 1; 
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Set DataSave Status
handles.Daq.SaveStatus = 1;
set(handles.radiobutton_SaveStatus,'Value', handles.Daq.SaveStatus);
%%% Set vortex charge list for data acquisition
dlg_title = 'Set vortex charge list';
prompt = {'Vortex charge list:'};
dims = [1 50];
def = {num2str(handles.SLM.VortexChargeListAcq)}; 
answer = inputdlg(prompt,dlg_title,dims,def);
%%% Read parameters
if isempty(answer)
   handles.SLM.VortexChargeListAcq = [0 11];
else 
   VortexChargeTemp = uint8(str2num(answer{1})); 
   VortexChargeTemp(find(VortexChargeTemp>30))= [];
   if length(VortexChargeTemp)== 0 | length(VortexChargeTemp)== 1
      VortexChargeTemp = [0 11];
   end
   handles.SLM.VortexChargeListAcq = double(VortexChargeTemp);
end
%%% Save handles
guidata(hObject, handles);
    
%%% DaqMode5 Configuration: pO2 Acq_TD_DeepTissueFast (SLM and Galvo Multi-Pts are used)   
function DaqMode5_Config(hObject, eventdata, handles)
%%% Set Modes
handles.Galvo.ScanMode = 1;     % 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts 
set(handles.radiobutton_MultiPointsGalvo,'value', 1);
handles.Eom.PowerMode = 1;      % 0: CW ; 1: TD Gated; 2: Sin; 3: Squ
set(handles.radiobutton_Gated,'value', 1);
handles.Daq.DaqStatus = 1;      % 0: SurveyScan 1: Acq Stack
set(handles.radiobutton_Acquisition,'value', 1);   
%%% Set PixelNum
handles.Galvo.PixelX = size(handles.Daq.SurveyScanImg,2);
handles.Galvo.PixelY = size(handles.Daq.SurveyScanImg,1);
UpdateGalvoTime(hObject, eventdata, handles);
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
%%% Set Eom UpdateRate
handles.Eom.AO_UpdateRate = 2e6;
%%% Set Eom Timing
handles.Eom.ExcPeriod = 300e-6;
handles.Eom.GateWidth = 10e-6;
set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
if handles.Eom.NumCycles <1000
   handles.Eom.NumCycles = 2000;       
   set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
else
end
handles.Galvo.AO_UpdateRate = 5e4;
handles.Galvo.AcqDelayTime = 10e-6;
%%% handles.Eom.PixelDwellTime = handles.Eom.ExcPeriod*handles.Eom.NumCycles;
handles.Eom.PixelDwellTime = (ceil(handles.Eom.ExcPeriod*handles.Galvo.AO_UpdateRate) + ceil(handles.Galvo.AcqDelayTime*handles.Galvo.AO_UpdateRate))*handles.Eom.NumCycles/handles.Galvo.AO_UpdateRate;
handles.Galvo.ExcPeriod = handles.Eom.ExcPeriod;
handles.Galvo.NumCycles = handles.Eom.NumCycles;
handles.Galvo.PixelDwellTime = handles.Eom.PixelDwellTime;
handles.Daq.PixelDwellTime = handles.Eom.PixelDwellTime;

set(handles.edit_PixelDwellTime,'string',num2str(handles.Eom.PixelDwellTime*1e6));
set(handles.edit_AcqDelayTime,'string', num2str(handles.Galvo.AcqDelayTime*1e6));
set(handles.edit_GalvoAO_UpdateRate,'string', num2str(handles.Galvo.AO_UpdateRate));
%%% Set Daq parameters
handles.Daq.PhotonCntrRes = 2e-6;
set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
handles.Daq.AI_SampleRate = 1e3;
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));   
%%% Set AI_ActiveChannel   
handles.Daq.CI_ActiveStatus = 1;
handles.Daq.AI_ActiveChannel([3:5]) = 0;
AI_ActiveChannelDisp(hObject, eventdata, handles);
%%% Set DataSave Status
handles.Daq.SaveStatus = 1;
set(handles.radiobutton_SaveStatus,'Value', handles.Daq.SaveStatus);
%%% Set vortex charge list for data acquisition
dlg_title = 'Set vortex charge list';
prompt = {'Vortex charge list:'};
dims = [1 50];
def = {num2str(handles.SLM.VortexChargeListAcq)}; 
answer = inputdlg(prompt,dlg_title,dims,def);
%%% Read parameters
if isempty(answer)
   handles.SLM.VortexChargeListAcq = [0];
else 
   VortexChargeTemp = uint8(str2num(answer{1})); 
   VortexChargeTemp(find(VortexChargeTemp>30)) = [];
   if length(VortexChargeTemp) == 0 | length(VortexChargeTemp) == 1
      VortexChargeTemp = [0 11];
   end
   handles.SLM.VortexChargeListAcq = double(VortexChargeTemp);
end
%%% Save handles
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Dispaly update  %%%%%%%%%%%%%%%%%%%%%%%%%%%     
%%% Set EomStatusDisplay
function EomStatusDisp(hObject, eventdata, handles)
set(handles.edit_PeakVoltage,'string',num2str(handles.Eom.PeakVoltage));
set(handles.slider_PeakVoltage, 'value', handles.Eom.PeakVoltage);
set(handles.edit_PowerPercentage, 'string',num2str(handles.Eom.PowerPercentage));
set(handles.slider_PowerPercentage, 'value', handles.Eom.PowerPercentage);
 
%%% Set AI_ActiveChannelDisplay
function AI_ActiveChannelDisp(hObject, eventdata, handles)
set(handles.radiobutton_ActiveCh1,'value', handles.Daq.CI_ActiveStatus);
set(handles.radiobutton_LaserPower,'value',handles.Daq.AI_ActiveChannel(0+1));
set(handles.radiobutton_Accelerometer,'value', handles.Daq.AI_ActiveChannel(1+1));
set(handles.radiobutton_ActiveCh2,'value', handles.Daq.AI_ActiveChannel(2+1));
set(handles.radiobutton_ActiveCh3,'value', handles.Daq.AI_ActiveChannel(3+1));
set(handles.radiobutton_ActiveCh4,'value', handles.Daq.AI_ActiveChannel(4+1));
set(handles.radiobutton_ActivePosX,'value', handles.Daq.AI_ActiveChannel(5+1));
set(handles.radiobutton_ActivePosY,'value', handles.Daq.AI_ActiveChannel(7+1));
set(handles.radiobutton_ActivePosFZ,'value', handles.Daq.AI_ActiveChannel(6+1));

%%% Set AI_InverseChannelDisplay
function AI_InverseChannelDisp(hObject, eventdata, handles)
set(handles.radiobutton_InvertEomAI,'value',handles.Daq.AI_InverseChannel(0+1));
set(handles.radiobutton_InvertCh2,'value', handles.Daq.AI_InverseChannel(2+1));
set(handles.radiobutton_InvertCh3,'value', handles.Daq.AI_InverseChannel(3+1));
set(handles.radiobutton_InvertCh4,'value', handles.Daq.AI_InverseChannel(4+1));

%%% Set DaqAIRangeDisplay
function DaqAIRangeDisp(hObject, eventdata, handles)
set(handles.popupmenu_AI_RangeCh2,'value', find(handles.Daq.AI_Range(2+1) == handles.Daq.AI_RangeList));
set(handles.popupmenu_AI_RangeCh3,'value', find(handles.Daq.AI_Range(3+1) == handles.Daq.AI_RangeList));
set(handles.popupmenu_AI_RangeCh4,'value', find(handles.Daq.AI_Range(4+1) == handles.Daq.AI_RangeList));

%%% Set ShutterStatusDisplay
function ShutterStatusDisp(hObject, eventdata, handles)
if handles.Daq.ShutterStatus(1) == 0
   set(handles.pushbutton_ShutterMain,'BackgroundColor',[0.94 0.94 0.94]);     
else
   set(handles.pushbutton_ShutterMain,'BackgroundColor',[1 0 0]);    
end

if handles.Daq.ShutterStatus(2) == 0
   set(handles.pushbutton_ShutterCh12,'BackgroundColor',[0.94 0.94 0.94]);    
else
   set(handles.pushbutton_ShutterCh12,'BackgroundColor',[1 0 0]);    
end

if handles.Daq.ShutterStatus(3) == 0
   set(handles.pushbutton_ShutterCh34,'BackgroundColor',[0.94 0.94 0.94]);    
else
   set(handles.pushbutton_ShutterCh34,'BackgroundColor',[1 0 0]);    
end

%%% Update GalvoTime
function UpdateGalvoTime(hObject, eventdata, handles)
if any(handles.Daq.DaqMode == [0 1])
   SettleVoltStep = max(handles.Galvo.VoltRangeX/(handles.Galvo.PixelX-1), handles.Galvo.VoltRangeY/(handles.Galvo.PixelY-1));
   FlybackVoltStep = max(handles.Galvo.VoltRangeX, handles.Galvo.VoltRangeY);
   handles.Galvo.GalvoSettleTime = ceil(68*SettleVoltStep + 300)/1e6;
   handles.Galvo.GalvoFlybackTime = ceil(68*FlybackVoltStep + 300)/1e6;
else
   handles.Galvo.GalvoSettleTime = 20e-6;
   FlybackVoltStep = max(handles.Galvo.VoltRangeX, handles.Galvo.VoltRangeY);
   handles.Galvo.GalvoFlybackTime = ceil(68*FlybackVoltStep + 300)/1e6;
end
set(handles.edit_GalvoSettleTime,'string',num2str(handles.Galvo.GalvoSettleTime*1e6));
set(handles.edit_GalvoFlybackTime,'string',num2str(handles.Galvo.GalvoFlybackTime*1e6));
%%% Save handles
guidata(hObject, handles);

%%% Update Stage status display
function UpdateStageStatusDisp(hObject, eventdata, handles)
%%% Usage status
%%% StageXY
if handles.Stages.UsageStatus(1)
   set(handles.pushbutton_ExitXY,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_ExitXY,'String','Exit');
else
   set(handles.pushbutton_ExitXY,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_ExitXY,'String','Init');
end
%%% StageZ
if handles.Stages.UsageStatus(3)
   set(handles.pushbutton_ExitZ,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_ExitZ,'String','Exit'); 
else
   set(handles.pushbutton_ExitZ,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_ExitZ,'String','Init');
end
%%% StageFZ
if handles.Stages.UsageStatus(4)
   set(handles.pushbutton_ExitFZ,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_ExitFZ,'String','Exit');
else
   set(handles.pushbutton_ExitFZ,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_ExitFZ,'String','Init');
end
%%% Current Pos
set(handles.text_CurrentPosX,'string',num2str(handles.Stages.CurrentPos(1)));
set(handles.text_CurrentPosY,'string',num2str(handles.Stages.CurrentPos(2)));
set(handles.text_CurrentPosZ,'string',num2str(handles.Stages.CurrentPos(3)));
set(handles.text_CurrentPosFZ,'string',num2str(handles.Stages.CurrentPos(4)));
%%% Set Pos
set(handles.edit_SetPosX,'string',num2str(handles.Stages.SetPos(1)));
set(handles.edit_SetPosY,'string',num2str(handles.Stages.SetPos(2)));
set(handles.edit_SetPosZ,'string',num2str(handles.Stages.SetPos(3)));
set(handles.edit_SetPosFZ,'string',num2str(handles.Stages.SetPos(4)));
%%% Move Step
set(handles.edit_StepX,'string',num2str(handles.Stages.StageStep(1)));
set(handles.edit_StepY,'string',num2str(handles.Stages.StageStep(2)));
set(handles.edit_StepZ,'string',num2str(handles.Stages.StageStep(3)));
set(handles.edit_StepFZ,'string',num2str(handles.Stages.StageStep(4)));
%%% FZ Parameters
set(handles.edit_FZ_SettleTime,'string',num2str(handles.Stages.StageFZ_SettleTime*1e6));
set(handles.edit_FZ_FlybackTime,'string',num2str(handles.Stages.StageFZ_FlybackTime*1e6));
set(handles.edit_FZ_AcqDelayTime,'string',num2str(handles.Stages.StageFZ_AcqDelayTime*1e6));
set(handles.radiobutton_FZ_Return,'value',handles.Stages.StageFZ_ReturnFlag);
set(handles.popupmenu_ObjectiveType,'value',handles.Stages.ObjectiveType); 

%%% Update Eom status display
function UpdateEomStatusDisp(hObject, eventdata, handles)
%%% PeakVoltage
set(handles.edit_PeakVoltage,'string',num2str(handles.Eom.PeakVoltage));
set(handles.slider_PeakVoltage,'max',1.5);
set(handles.slider_PeakVoltage,'min',0);
set(handles.slider_PeakVoltage,'value',handles.Eom.PeakVoltage);
%%% PowerPercentage
set(handles.edit_PowerPercentage,'string',num2str(handles.Eom.PowerPercentage));
set(handles.slider_PowerPercentage,'max',100);
set(handles.slider_PowerPercentage,'min',0);
set(handles.slider_PowerPercentage,'value',handles.Eom.PowerPercentage);
%%% Eom Parameters
set(handles.edit_ExcPeriod,'string',num2str(handles.Eom.ExcPeriod*1e6));
set(handles.edit_GateWidth,'string',num2str(handles.Eom.GateWidth*1e6));
set(handles.edit_NumCycles,'string',num2str(handles.Eom.NumCycles));
set(handles.edit_EomAO_UpdateRate,'string',num2str(handles.Eom.AO_UpdateRate));
set(handles.radiobutton_LaserOutStatus, 'value', handles.Eom.LaserOutStatus);
switch handles.Eom.PowerMode  % 0: CW; 1: TD 
    case 0
       set(handles.radiobutton_CW, 'value',1);
    case 1 
       set(handles.radiobutton_Gated, 'value',1); 
end

%%% Update Galvo status display
function UpdateGalvoStatusDisp(hObject, eventdata, handles)
%%% X Para
set(handles.edit_VoltRangeX,'string',num2str(handles.Galvo.VoltRangeX));
set(handles.edit_PixelX,'string',num2str(handles.Galvo.PixelX));
set(handles.edit_VoltOffsetX,'string',num2str(handles.Galvo.VoltOffsetX));
%%% Y Para
set(handles.edit_VoltRangeY,'string',num2str(handles.Galvo.VoltRangeY));
set(handles.edit_PixelY,'string',num2str(handles.Galvo.PixelY));
set(handles.edit_VoltOffsetY,'string',num2str(handles.Galvo.VoltOffsetY));
%%% Set SquareFOV status
set(handles.radiobutton_SquFOV,'value',handles.Galvo.SquFOV_Status);
%%% Timing Para
set(handles.edit_FillFraction,'string',num2str(handles.Galvo.FillFraction*100));
set(handles.edit_GalvoAO_UpdateRate,'string',num2str(handles.Galvo.AO_UpdateRate));
set(handles.edit_GalvoSettleTime,'string',num2str(handles.Galvo.GalvoSettleTime*1e6));
set(handles.edit_GalvoFlybackTime,'string',num2str(handles.Galvo.GalvoFlybackTime*1e6));
set(handles.edit_PixelDwellTime,'string',num2str(handles.Galvo.PixelDwellTime*1e6));
set(handles.edit_AcqDelayTime,'string',num2str(handles.Galvo.AcqDelayTime*1e6));
%%% Mode 
if handles.Galvo.WavDisplayMode  %%% 0: Galvo waveform display; 1: StageFZ waveform display 
   set(handles.radiobutton_FZ_WavDisplay,'value',handles.Galvo.WavDisplayMode); 
else
   set(handles.radiobutton_GalvoWavDisplay,'value',~handles.Galvo.WavDisplayMode);
end
set(handles.radiobutton_BidirectionScan,'value',handles.Galvo.BidirectionScan); %%%  0: Uni-direction 1: Bi-direction
switch handles.Galvo.ScanMode    %%% 0: Scan; 1: Galvo Multi-Pts 2: SLM Multi-Pts
    case 0
       set(handles.radiobutton_RasterScan,'value',1); 
    case 1
       set(handles.radiobutton_MultiPointsGalvo,'value',1); 
end
%%% Fov size display
set(handles.text_SysFOV,'string',['FOV:',num2str(handles.Galvo.FOV,'%.0f'),'um']);

%%% Update Daq status display
function UpdateDaqStatusDisp(hObject, eventdata, handles)
set(handles.edit_PhotonCntrRes,'string',num2str(handles.Daq.PhotonCntrRes*1e6));
set(handles.edit_AI_SampleRate,'string',num2str(handles.Daq.AI_SampleRate));
set(handles.edit_SamplePerPx,'string',num2str(handles.Daq.SamplePerPx));
set(handles.edit_StackStart,'string',num2str(handles.Daq.StackInfo(1)));
set(handles.edit_StackEnd,'string',num2str(handles.Daq.StackInfo(2)));
set(handles.edit_StackStep,'string',num2str(handles.Daq.StackInfo(3)));
set(handles.edit_FrameNum,'string',num2str(handles.Daq.FrameNum));
set(handles.edit_DaqRepeat,'string',num2str(handles.Daq.DaqRepeat));
set(handles.edit_SavePath,'string',handles.Daq.SavePath);
set(handles.radiobutton_DisplayStatus,'value', handles.Daq.DisplayStatus);
set(handles.radiobutton_SaveStatus,'value', handles.Daq.SaveStatus);
set(handles.edit_SaveFilename,'string',handles.Daq.SaveFilename);
set(handles.radiobutton_AcqAllPhotonStatus,'value',handles.Daq.AcqAllPhotonStatus);
set(handles.edit_Ch1ColorbarMax,'string', num2str(handles.Daq.AxesColorbarMax(1))); 
set(handles.edit_Ch2ColorbarMax,'string', num2str(handles.Daq.AxesColorbarMax(2))); 
set(handles.edit_Ch3ColorbarMax,'string', num2str(handles.Daq.AxesColorbarMax(3))); 
set(handles.edit_Ch4ColorbarMax,'string', num2str(handles.Daq.AxesColorbarMax(4))); 
set(handles.edit_Ch1ColorbarMin,'string', num2str(handles.Daq.AxesColorbarMin(1))); 
set(handles.edit_Ch2ColorbarMin,'string', num2str(handles.Daq.AxesColorbarMin(2))); 
set(handles.edit_Ch3ColorbarMin,'string', num2str(handles.Daq.AxesColorbarMin(3))); 
set(handles.edit_Ch4ColorbarMin,'string', num2str(handles.Daq.AxesColorbarMin(4))); 
set(handles.popupmenu_ColormapCh1,'value',handles.Daq.AxesColormap(1));
set(handles.popupmenu_ColormapCh2,'value',handles.Daq.AxesColormap(2));
set(handles.popupmenu_ColormapCh3,'value',handles.Daq.AxesColormap(3));
set(handles.popupmenu_ColormapCh4,'value',handles.Daq.AxesColormap(4));
set(handles.radiobutton_FilterSurveyscan,'value',handles.Daq.SurveyScanFtrStatus);
%%% Update FrameRate
set(handles.text_FrameRate,'string', num2str(handles.Daq.FrameRate));
%%% Update DaqMode
set(handles.popupmenu_DaqMode,'value',handles.Daq.DaqMode+1);
%%% PMT Channels Settings
AI_ActiveChannelDisp(hObject, eventdata, handles);
AI_InverseChannelDisp(hObject, eventdata, handles);
DaqAIRangeDisp(hObject, eventdata, handles);
ShutterStatusDisp(hObject, eventdata, handles);

%%% Update SLM status display
function UpdateSLM_StatusDisp(hObject, eventdata, handles)
%%% Usage status
if handles.SLM.UsageStatus ~= 0 
   set(handles.pushbutton_ExitSLM,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_ExitSLM,'String','Exit'); 
else
   set(handles.pushbutton_ExitSLM,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_ExitSLM,'String','Init');
end

%%% Generate SLM mask
function Mask = SLM_MaskGenVortex(CenterPosX, CenterPosY, GratingPeriod, VortexCharge, Path)
row = 512;
col = 512;                  
x = ([0.5:1:col-0.5] - col/2)- CenterPosX;
y = ([0.5:1:row-0.5] - row/2)- CenterPosY;
[X,Y] = meshgrid(x, y);
phi = angle(X+1i*Y); %%% Azimuthal angle
fx = 1/GratingPeriod; 
fy = 0;
Temp = mod(VortexCharge*phi+2*pi*(Y*fy+X*fx),2*pi);
Mask = uint16(Temp/max(Temp(:))*65535);
imwrite(Mask,Path);

%%% Display SLM mask in GUI
function SLM_MaskDisp(ImgHandle, Mask)
axes(ImgHandle);
imshow(Mask);
colormap(gray);
axis tight
axis equal

%%% Update BaslerCamera status display
function UpdateCameraStatusDisp(hObject, eventdata, handles)
%%% Usage status
if handles.Camera.UsageStatus
   set(handles.pushbutton_ExitCam,'BackgroundColor',[1 0 0]); 
   set(handles.pushbutton_ExitCam,'String','Exit'); 
   %%% 
   set(handles.popupmenu_BitDepth,'value',find(ismember(handles.Camera.BitDepthOption,handles.Camera.BitDepth)));
   set(handles.edit_SequenceSaveNum,'string',num2str(handles.Camera.BaslerVid.FramesPerTrigger));
   set(handles.radiobutton_AutoExposure,'value',0);
   set(handles.radiobutton_AutoGain,'value',0);
   set(handles.radiobutton_CameraTrigger,'value',0);
   set(handles.popupmenu_X_Binning,'value',1);
   set(handles.popupmenu_Y_Binning,'value',1);
   set(handles.edit_CameraSavePath,'string',handles.Camera.SavePath);
   %%% Exposure time
   set(handles.edit_ExposureTime,'string',num2str(handles.Camera.BaslerSrc.ExposureTime));
   set(handles.slider_ExposureTime,'max',1e6);
   set(handles.slider_ExposureTime,'min',59);
   set(handles.slider_ExposureTime,'value',handles.Camera.BaslerSrc.ExposureTime);
   %%% Framerate
   set(handles.edit_FrameRate,'string',num2str(handles.Camera.BaslerSrc.ResultingFrameRate));
   set(handles.slider_FrameRate,'max',handles.Camera.BaslerSrc.ResultingFrameRate);
   set(handles.slider_FrameRate,'min',2e-3);
   set(handles.slider_FrameRate,'value',handles.Camera.BaslerSrc.ResultingFrameRate);
   %%% BlaclLevel
   set(handles.edit_BlackLevel,'string',num2str(handles.Camera.BaslerSrc.BlackLevel));
   set(handles.slider_BlackLevel,'max',255);
   set(handles.slider_BlackLevel,'min',0);
   set(handles.slider_BlackLevel,'value',handles.Camera.BaslerSrc.BlackLevel);
   %%% Camera Gain
   set(handles.edit_Gain,'string',num2str(handles.Camera.BaslerSrc.Gain));
   set(handles.slider_Gain,'max',12);
   set(handles.slider_Gain,'min',0);
   set(handles.slider_Gain,'value',handles.Camera.BaslerSrc.Gain);
else
   set(handles.pushbutton_ExitCam,'BackgroundColor',[0.94 0.94 0.94]); 
   set(handles.pushbutton_ExitCam,'String','Init');
end

%%% Update system status
function DispSystStatus(handles, status_text)
s_SystemStatus = get(handles.listbox_SystemStatus,'string');
s_SystemStatus{end+1} = status_text;
set(handles.listbox_SystemStatus,'string', s_SystemStatus);
set(handles.listbox_SystemStatus,'value', size(s_SystemStatus,1));

%%% Display acquired data
function DispAcqData(hObject, eventdata, handles, data)
for i = 1: size(data, 3)
    TempChan = squeeze(data(:,:,i));
    switch i
       case 1 
            axes(handles.axes_Ch1);
            handles.Daq.AxesColorbarMin(1) = min(TempChan(:));
            if max(TempChan(:)) > min(TempChan(:))
               handles.Daq.AxesColorbarMax(1) = max(TempChan(:));
            else
               handles.Daq.AxesColorbarMax(1) = max(TempChan(:))+10; 
            end
            set(handles.edit_Ch1ColorbarMin, 'string', num2str(handles.Daq.AxesColorbarMin(1)));
            set(handles.edit_Ch1ColorbarMax, 'string', num2str(handles.Daq.AxesColorbarMax(1)));
            h_img = imagesc(fliplr(TempChan), [handles.Daq.AxesColorbarMin(1) handles.Daq.AxesColorbarMax(1)]);
            set(h_img,'uicontextmenu',handles.ContextmenuCh1);
            colormap(handles.axes_Ch1,handles.Daq.ColormapRange{handles.Daq.AxesColormap(1)});
            colorbar(handles.axes_Ch1, 'Position', [0.695 0.53 0.01 0.44]);
            set(handles.axes_Ch1,'FontSize',8,'OuterPosition',[0.45 0.45 0.28 0.54],'Position',[0.47 0.53 0.22 0.44]);
            set(h_img,'Tag','axes_Ch1');
       case 2
            axes(handles.axes_Ch2);
            handles.Daq.AxesColorbarMin(2) = min(TempChan(:));
            if max(TempChan(:)) > min(TempChan(:))
               handles.Daq.AxesColorbarMax(2) = max(TempChan(:));
            else
               handles.Daq.AxesColorbarMax(2) = max(TempChan(:))+10; 
            end
            set(handles.edit_Ch2ColorbarMin, 'string', num2str(handles.Daq.AxesColorbarMin(2)));
            set(handles.edit_Ch2ColorbarMax, 'string', num2str(handles.Daq.AxesColorbarMax(2)));
            h_img = imagesc(fliplr(TempChan), [handles.Daq.AxesColorbarMin(2) handles.Daq.AxesColorbarMax(2)]);
            set(h_img,'uicontextmenu',handles.ContextmenuCh2);
            colormap(handles.axes_Ch2,handles.Daq.ColormapRange{handles.Daq.AxesColormap(2)});
            colorbar(handles.axes_Ch2, 'Position', [0.97 0.53 0.01 0.44]);
            set(handles.axes_Ch2,'FontSize',8,'OuterPosition',[0.725 0.45 0.28 0.54],'Position',[0.745 0.53 0.22 0.44]);
            set(h_img,'Tag','axes_Ch2');
       case 3
            axes(handles.axes_Ch3);
            handles.Daq.AxesColorbarMin(3) = min(TempChan(:));
            if max(TempChan(:)) > min(TempChan(:))
               handles.Daq.AxesColorbarMax(3) = max(TempChan(:));
            else
               handles.Daq.AxesColorbarMax(3) = max(TempChan(:))+10; 
            end
            set(handles.edit_Ch3ColorbarMin, 'string', num2str(handles.Daq.AxesColorbarMin(3)));
            set(handles.edit_Ch3ColorbarMax, 'string', num2str(handles.Daq.AxesColorbarMax(3)));
            h_img = imagesc(fliplr(TempChan), [handles.Daq.AxesColorbarMin(3) handles.Daq.AxesColorbarMax(3)]);
            set(h_img,'uicontextmenu',handles.ContextmenuCh3);
            colormap(handles.axes_Ch3,handles.Daq.ColormapRange{handles.Daq.AxesColormap(3)});
            colorbar(handles.axes_Ch3, 'Position', [0.695 0.037 0.01 0.44]);
            set(handles.axes_Ch3,'FontSize',8,'OuterPosition',[0.45 -0.023 0.28 0.54],'Position',[0.47 0.037 0.22 0.44]); 
            set(h_img,'Tag','axes_Ch3');
       case 4
            axes(handles.axes_Ch4);
            handles.Daq.AxesColorbarMin(4) = min(TempChan(:));
            if max(TempChan(:)) > min(TempChan(:))
               handles.Daq.AxesColorbarMax(4) = max(TempChan(:));
            else
               handles.Daq.AxesColorbarMax(4) = max(TempChan(:))+10; 
            end
            set(handles.edit_Ch4ColorbarMin, 'string', num2str(handles.Daq.AxesColorbarMin(4)));
            set(handles.edit_Ch4ColorbarMax, 'string', num2str(handles.Daq.AxesColorbarMax(4)));
            h_img = imagesc(fliplr(TempChan), [handles.Daq.AxesColorbarMin(4) handles.Daq.AxesColorbarMax(4)]);
            set(h_img,'uicontextmenu',handles.ContextmenuCh4);
            colormap(handles.axes_Ch4,handles.Daq.ColormapRange{handles.Daq.AxesColormap(4)});
            colorbar(handles.axes_Ch4, 'Position', [0.97 0.037 0.01 0.44]);
            set(handles.axes_Ch4,'FontSize',8,'OuterPosition',[0.725 -0.023 0.28 0.54],'Position',[0.745 0.037 0.22 0.44]); 
            set(h_img,'Tag','axes_Ch4');
    end    
end
%%% Save handles
guidata(hObject, handles);

%%% Callback functions for result image save menu
function ResultImageSaveCh1_Fcn(hObject, eventdata, axes_handle, savepath)
[file, path] = uiputfile([savepath 'Image_Ch1.bmp']);
if file ~= 0  
   set(axes_handle,'Visible','Off');
   Image = frame2im(getframe(axes_handle));
   imwrite(Image, [path file]);
   set(axes_handle,'Visible','On');
end

function ResultImageSaveCh2_Fcn(hObject, eventdata, axes_handle, savepath)
[file, path] = uiputfile([savepath 'Image_Ch2.bmp']);
if file ~= 0  
   set(axes_handle,'Visible','Off');
   Image = frame2im(getframe(axes_handle));
   imwrite(Image, [path file]);
   set(axes_handle,'Visible','On');
end

function ResultImageSaveCh3_Fcn(hObject, eventdata, axes_handle, savepath)
[file, path] = uiputfile([savepath 'Image_Ch3.bmp']);
if file ~= 0 
   set(axes_handle,'Visible','Off');
   Image = frame2im(getframe(axes_handle));
   imwrite(Image, [path file]);
   set(axes_handle,'Visible','On');
end

function ResultImageSaveCh4_Fcn(hObject, eventdata, axes_handle, savepath)
[file, path] = uiputfile([savepath 'Image_Ch4.bmp']);
if file ~= 0 
   set(axes_handle,'Visible','Off');
   Image = frame2im(getframe(axes_handle));
   imwrite(Image, [path file]);
   set(axes_handle,'Visible','On');
end

%%% Window button move function
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
CurFig = gcf;
hUI_Obj = hittest(hObject);
hUI_ObjIndex = find(strcmp(hUI_Obj.Tag,{'axes_Ch1', 'axes_Ch2', 'axes_Ch3', 'axes_Ch4', 'axes_CriticalDisplay'}));
if ~isempty(hUI_ObjIndex) & strcmp(CurFig.Name,'PLIM_PO2')
   set(gcf,'Pointer','cross'); 
   switch hUI_ObjIndex
       case 1
          PixelPos = round(get(handles.axes_Ch1,'currentpoint')); 
          DataObj = get(handles.axes_Ch1,'Children');
          if ~isempty(DataObj)
             if isprop(DataObj,'CData')
                ImgData = DataObj.CData;
                set(handles.text_PixelInfoCh1,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
             else
                set(handles.text_PixelInfoCh1,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
             end
          else
             set(handles.text_PixelInfoCh1,'string',' ');
          end
       case 2
          PixelPos = round(get(handles.axes_Ch2,'currentpoint')); 
          DataObj = get(handles.axes_Ch2,'Children');
          if ~isempty(DataObj)
             if isprop(DataObj,'CData') 
                ImgData = DataObj.CData;
                set(handles.text_PixelInfoCh2,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
             else
                set(handles.text_PixelInfoCh2,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
             end
          else
             set(handles.text_PixelInfoCh2,'string',' '); 
          end
       case 3
          PixelPos = round(get(handles.axes_Ch3,'currentpoint')); 
          DataObj = get(handles.axes_Ch3,'Children');
          if ~isempty(DataObj)
             if isprop(DataObj,'CData')
                ImgData = DataObj.CData;
                set(handles.text_PixelInfoCh3,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
             else
                set(handles.text_PixelInfoCh3,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
             end
          else
             set(handles.text_PixelInfoCh3,'string',' ');
          end
       case 4
          PixelPos = round(get(handles.axes_Ch4,'currentpoint')); 
          DataObj = get(handles.axes_Ch4,'Children');
          if ~isempty(DataObj)
             if isprop(DataObj,'CData')
                ImgData = DataObj.CData;
                set(handles.text_PixelInfoCh4,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
             else
                set(handles.text_PixelInfoCh4,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
             end
          else
             set(handles.text_PixelInfoCh4,'string',' ');
          end
       case 5
          PixelPos = round(get(handles.axes_CriticalDisplay,'currentpoint'));
          DataObjTemp = get(handles.axes_CriticalDisplay,'Children');
          if find(handles.CriticalDispMode) == 1 & ~isempty(DataObjTemp) == 1
             if PixelPos(1,2)>= 1 & PixelPos(1,2)<= 1024  & PixelPos(1,1)>= 1 & PixelPos(1,1)<= 1280
                DataObj = DataObjTemp(size(DataObjTemp,1));
                if isprop(DataObj,'CData')
                   ImgData = DataObj.CData;
                   set(handles.text_PixelInfoCriticalDisp,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
                   set(handles.edit_SurveyScanColorbarMin,'string', num2str(min(ImgData(:))));
                   set(handles.edit_SurveyScanColorbarMax,'string', num2str(max(ImgData(:))));
                else
                   set(handles.text_PixelInfoCriticalDisp,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
                end  
             else
                set(handles.text_PixelInfoCriticalDisp,'string',' '); 
             end
          elseif find(handles.CriticalDispMode) == 3 & ~isempty(DataObjTemp) == 1
             DataObj = DataObjTemp(size(DataObjTemp,1)); 
             if isprop(DataObj,'CData') 
                ImgData = DataObj.CData;
                set(handles.text_PixelInfoCriticalDisp,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),'], Intensity: ', num2str(ImgData(PixelPos(1,2),PixelPos(1,1)))]);
             else
                set(handles.text_PixelInfoCriticalDisp,'string',['[',num2str(PixelPos(1,1)),',',num2str(PixelPos(1,2)),']']);    
             end   
          else
             set(handles.text_PixelInfoCriticalDisp,'string',' '); 
          end
   end
else
   set(handles.text_PixelInfoCh1,'string',' ');
   set(handles.text_PixelInfoCh2,'string',' ');
   set(handles.text_PixelInfoCh3,'string',' ');
   set(handles.text_PixelInfoCh4,'string',' ');
   set(handles.text_PixelInfoCriticalDisp,'string',' ');
   set(gcf,'Pointer','arrow'); 
end

%%% Close GUI
function figure1_CloseRequestFcn(hObject, eventdata, handles)
selection = questdlg('Close PLIM PO2 Software ?',...
      'Close Request Function',...
      'Yes','No','No'); 
      switch selection
      case 'Yes'
         %%% delete timers 
         if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
         end
         %%% delete hObject & handles
         if isfield(handles,'Stages')
            %%% Close StageZ
            if handles.Stages.UsageStatus(3)
               handles.Stages.CurrentPos(3) = -MCM3000_Pos_Decode(handles.Stages.ControllerZ)*1000;
               handles.Stages.CloseStageZ();
               fprintf('ZFM2020 stage is closed ! \n');
            end
            SavedPos = handles.Stages.CurrentPos;
            save('E:\PLIM_PO2\SaveStagePos\SavedPos.mat','SavedPos');
            %%% Close StageXY
            if any(handles.Stages.UsageStatus(1:2))  
               handles.Stages.CloseStageXY();
               fprintf('M-126 stages are closed \n'); 
            end
            %%% Close StageFZ
            if handles.Stages.UsageStatus(4)
               handles.Stages.CloseStageFZ();
               fprintf('PFM450E stage is closed ! \n');
            end
         end
         %%% Close Eom, Galvo and Daq 
         if isfield(handles,'Eom')
            handles.Eom.Close();
            fprintf('Eom is closed ! \n');
         end
         if isfield(handles,'Galvo')
            handles.Galvo.Close();
            fprintf('Galvo is closed ! \n');
         end 
         if isfield(handles,'Daq')
            handles.Daq.Close();
            fprintf('Shutters are closed ! \n');
            fprintf('Daq tasks are cleared ! \n');
            %%% delete empty folder if no data were saved
            listing = dir(handles.Daq.SavePath);
            if length({listing.name}) == 2
               rmdir(handles.Daq.SavePath); 
            else
            end
         end
         %%% Close Camera and SLM
         if handles.Camera.UsageStatus  
            handles.Camera.Close();
            fprintf('Basler camera is closed ! \n');
         end
         if handles.SLM.UsageStatus ~= 0
            close(SLM_Control);
            fprintf('SLM is closed ! \n');
         end
         delete(hObject);
      case 'No'
         return 
      end
%%%%%%%%%%%%%%%%%%%%  End of PLIM_PO2.m  %%%%%%%%%%%%%%%%%%%%%%
