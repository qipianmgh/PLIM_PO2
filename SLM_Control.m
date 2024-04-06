function varargout = SLM_Control(varargin)
%%% Edit the above text to modify the response to help SLM_Control

%%% Last Modified by GUIDE v2.5 01-Jun-2022 22:07:16

%%% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SLM_Control_OpeningFcn, ...
                   'gui_OutputFcn',  @SLM_Control_OutputFcn, ...
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
%%% End initialization code - DO NOT EDIT

%%% --- Executes just before SLM_Control is made visible.
function SLM_Control_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%%% Load parameters of SLM and perform initialization
hMainGui = findobj('Name','PLIM_PO2');
hhMainGui = guidata(hMainGui);
handles.SLM = hhMainGui.SLM;
%%% Set display
set(handles.popupmenu_GratingPeriod,'value', find(handles.SLM.GratingPeriodList == handles.SLM.GratingPeriod));
set(handles.popupmenu_VortexMaskCharge,'value', handles.SLM.VortexCharge+1);
set(handles.edit_LutFilePath,'string',handles.SLM.LutFilePath);
set(handles.edit_CalFilePath,'string',handles.SLM.CalFilePath);
set(handles.edit_CenterPosX,'string',num2str(handles.SLM.CenterPosX));
set(handles.edit_CenterPosY,'string',num2str(handles.SLM.CenterPosY));
set(handles.edit_CenterMoveStep,'string',num2str(handles.SLM.CenterMoveStep));
%%% Generate vortex mask 
handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
if handles.SLM.UsageStatus == 0
   handles.SLM.Init();
   handles.SLM.MaskProj();
else
end
%%% Update handles structure
hhMainGui.SLM = handles.SLM; 
guidata(hMainGui,hhMainGui);
guidata(hObject,handles);

function varargout = SLM_Control_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function uibuttongroup_SLM_Mode_SelectionChangedFcn(hObject, eventdata, handles)
hMainGui = findobj('Name','PLIM_PO2');
hhMainGui = guidata(hMainGui);
if get(handles.radiobutton_Vortex,'value')==1 
   handles.SLM.UsageStatus = 1;
   handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
   handles.SLM.Tar = [];
   handles.SLM.MSE = [];
   SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
   handles.SLM.MaskProj(); 
else
   handles.SLM.UsageStatus = 1;
   set(handles.radiobutton_Vortex,'value')= 1; 
   handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
   handles.SLM.Tar = [];
   handles.SLM.MSE = [];
   SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
   handles.SLM.MaskProj();   
end
set(handles.radiobutton_DispMask,'value',1);
handles.SLM.DispMode = 0;
%%% Update handles structure
hhMainGui.SLM = handles.SLM; 
guidata(hMainGui,hhMainGui);
guidata(hObject,handles);

function pushbutton_LoadLutFile_Callback(hObject, eventdata, handles)
%%% LUT loading only take into effect after SLM restart
[file, path] = uigetfile('*.lut','Select SLM Lut file');
if file ~= 0
   handles.SLM.LutFilePath = [path file];
   BNS_SetPower(0);
   BNS_CloseSLM();
   pause(1);  %%% Must set pause before restart SLM
   NumBoards = BNS_OpenSLMs();  
   BNS_LoadLUTFile(1, handles.SLM.LutFilePath);
   BNS_ReadTIFF(handles.SLM.CalFilePath, handles.SLM.ImageBuffer);
   BNS_WriteCal(handles.SLM.ImageBuffer);
   %%% Turn on SLM power
   BNS_SetPower(1);
   handles.SLM.MaskProj();

   set(handles.edit_LutFilePath,'string',handles.SLM.LutFilePath);
   %%% Update handles structure
   hMainGui = findobj('Name','PLIM_PO2');
   hhMainGui = guidata(hMainGui);
   hhMainGui.SLM = handles.SLM; 
   guidata(hMainGui,hhMainGui);
   guidata(hObject,handles);
end

function pushbutton_LoadCalFile_Callback(hObject, eventdata, handles)
%%% Cal Img loading only take into effect after SLM restart
[file, path] = uigetfile('*.tiff','Select SLM Cal file');
if file ~= 0
   handles.SLM.CalFilePath = [path file];
   BNS_SetPower(0);
   BNS_CloseSLM();
   pause(1);  %%% Must set pause before restart SLM
   NumBoards = BNS_OpenSLMs();  
   BNS_LoadLUTFile(1, handles.SLM.LutFilePath);
   BNS_ReadTIFF(handles.SLM.CalFilePath, handles.SLM.ImageBuffer);
   BNS_WriteCal(handles.SLM.ImageBuffer);
   %%% Turn on SLM power
   BNS_SetPower(1);
   handles.SLM.MaskProj(); 

   set(handles.edit_CalFilePath,'string',handles.SLM.CalFilePath);
   %%% Update handles structure
   hMainGui = findobj('Name','PLIM_PO2');
   hhMainGui = guidata(hMainGui);
   hhMainGui.SLM = handles.SLM; 
   guidata(hMainGui,hhMainGui);
   guidata(hObject,handles); 
end

function edit_LutFilePath_Callback(hObject, eventdata, handles)
set(handles.edit_LutFilePath,'string',handles.SLM.LutFilePath); 

function edit_CalFilePath_Callback(hObject, eventdata, handles)
set(handles.edit_CalFilePath,'string',handles.SLM.CalFilePath); 

function pushbutton_Up_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
    val = handles.SLM.CenterPosY - handles.SLM.CenterMoveStep;
    if val < -255.5
       handles.SLM.CenterPosY = val + 512; 
    else
       handles.SLM.CenterPosY = val; 
    end
    set(handles.edit_CenterPosY,'string',num2str(handles.SLM.CenterPosY));
    handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
    SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
    handles.SLM.MaskProj(); 
    %%% Update handles structure
    hMainGui = findobj('Name','PLIM_PO2');
    hhMainGui = guidata(hMainGui);
    hhMainGui.SLM = handles.SLM; 
    guidata(hMainGui,hhMainGui);
    guidata(hObject,handles);
end

function pushbutton_Down_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
    val = handles.SLM.CenterPosY + handles.SLM.CenterMoveStep;
    if val > 255.5
       handles.SLM.CenterPosY = val - 512; 
    else
       handles.SLM.CenterPosY = val; 
    end
    set(handles.edit_CenterPosY,'string',num2str(handles.SLM.CenterPosY));
    handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
    SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
    handles.SLM.MaskProj();
    %%% Update handles structure
    hMainGui = findobj('Name','PLIM_PO2');
    hhMainGui = guidata(hMainGui);
    hhMainGui.SLM = handles.SLM; 
    guidata(hMainGui,hhMainGui);
    guidata(hObject,handles);
end

function pushbutton_Left_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
    val = handles.SLM.CenterPosX - handles.SLM.CenterMoveStep;
    if val < -255.5
       handles.SLM.CenterPosX = val + 512; 
    else
       handles.SLM.CenterPosX = val; 
    end
    set(handles.edit_CenterPosX,'string',num2str(handles.SLM.CenterPosX));
    handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX,handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
    SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
    handles.SLM.MaskProj();
    %%% Update handles structure
    hMainGui = findobj('Name','PLIM_PO2');
    hhMainGui = guidata(hMainGui);
    hhMainGui.SLM = handles.SLM; 
    guidata(hMainGui,hhMainGui);
    guidata(hObject,handles);
end

function pushbutton_Right_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
    val = handles.SLM.CenterPosX + handles.SLM.CenterMoveStep;
    if val > 255.5
       handles.SLM.CenterPosX = val - 512; 
    else
       handles.SLM.CenterPosX = val; 
    end
    set(handles.edit_CenterPosX,'string',num2str(handles.SLM.CenterPosX));
    handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX,handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
    SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
    handles.SLM.MaskProj();
    %%% Update handles structure
    hMainGui = findobj('Name','PLIM_PO2');
    hhMainGui = guidata(hMainGui);
    hhMainGui.SLM = handles.SLM; 
    guidata(hMainGui,hhMainGui);
    guidata(hObject,handles);
end

function edit_CenterMoveStep_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
    val = round(str2double(get(handles.edit_CenterMoveStep,'string'))/0.5)*0.5;
    if val >= 0.5 | val <= 10
       handles.SLM.CenterMoveStep = val;
       set(handles.edit_CenterMoveStep,'string',num2str(handles.SLM.CenterMoveStep)); 
    else
       set(handles.edit_CenterMoveStep,'string',num2str(handles.SLM.CenterMoveStep)); 
    end
    %%% Update handles structure
    hMainGui = findobj('Name','PLIM_PO2');
    hhMainGui = guidata(hMainGui);
    hhMainGui.SLM = handles.SLM; 
    guidata(hMainGui,hhMainGui);
    guidata(hObject,handles);
end

function edit_CenterPosX_Callback(hObject, eventdata, handles)
set(handles.edit_CenterPosX,'string',handles.SLM.CenterPosX); 

function edit_CenterPosY_Callback(hObject, eventdata, handles)
set(handles.edit_CenterPosY,'string',handles.SLM.CenterPosY); 

function popupmenu_GratingPeriod_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
   Ind = get(handles.popupmenu_GratingPeriod,'Value');
   handles.SLM.GratingPeriod = handles.SLM.GratingPeriodList(Ind);
   handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
   SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
   handles.SLM.MaskProj(); 
   %%% Update handles structure
   hMainGui = findobj('Name','PLIM_PO2');
   hhMainGui = guidata(hMainGui);
   hhMainGui.SLM = handles.SLM; 
   guidata(hMainGui,hhMainGui);
   guidata(hObject,handles);
else
   set(handles.popupmenu_GratingPeriod,'value', find(handles.SLM.GratingPeriodList == handles.SLM.GratingPeriod));
end

function popupmenu_VortexMaskCharge_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
   Ind = get(handles.popupmenu_VortexMaskCharge,'Value');
   handles.SLM.VortexCharge = Ind-1; 
   handles.SLM.Mask = SLM_MaskGenVortex(handles.SLM.CenterPosX, handles.SLM.CenterPosY, handles.SLM.GratingPeriod, handles.SLM.VortexCharge, handles.SLM.ActiveMaskPath);
   SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
   handles.SLM.MaskProj(); 
   %%% Update handles structure
   hMainGui = findobj('Name','PLIM_PO2');
   hhMainGui = guidata(hMainGui);
   hhMainGui.SLM = handles.SLM; 
   guidata(hMainGui,hhMainGui);
   guidata(hObject,handles);
else
   set(handles.popupmenu_VortexMaskCharge,'value', handles.SLM.VortexCharge+1); 
end

function pushbutton_SaveMask_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
   MaskSaveName = ['Vortex_X',num2str(handles.SLM.CenterPosX+256.5),'_Y',num2str(handles.SLM.CenterPosY+256.5),'_G',num2str(handles.SLM.GratingPeriod),'_L',num2str(handles.SLM.VortexCharge),'.tiff'];
   [file, path] = uiputfile('E:\PLIM_PO2\SLM_Control_Functions\Masks\*.tiff','Save SLM Mask',MaskSaveName);
   if file ~= 0
      imwrite(handles.SLM.Mask,[path file]);
   end
end      

function pushbutton_LoadMask_Callback(hObject, eventdata, handles)
if handles.SLM.UsageStatus == 1
   [file, path] = uigetfile('E:\PLIM_PO2\SLM_Control_Functions\Masks\*.tiff','Select SLM Mask file');
   if file ~= 0 & contains(file,'Vortex_')
      VortexPara = regexp(file,'\d*\.*\d+','match');
      if ~isempty(VortexPara) & length(VortexPara)== 4
         handles.SLM.CenterPosX = str2double(VortexPara{1})-256.5;
         handles.SLM.CenterPosY = str2double(VortexPara{2})-256.5;             
         handles.SLM.GratingPeriod = str2double(VortexPara{3});
         handles.SLM.VortexCharge = str2double(VortexPara{4});

         set(handles.edit_CenterPosX,'string',num2str(handles.SLM.CenterPosX));
         set(handles.edit_CenterPosY,'string',num2str(handles.SLM.CenterPosY));
         set(handles.popupmenu_GratingPeriod,'Value', find(handles.SLM.GratingPeriodList == handles.SLM.GratingPeriod));
         set(handles.popupmenu_VortexMaskCharge,'Value', handles.SLM.VortexCharge+1);
   
         handles.SLM.Mask = imread([path,file]);
         imwrite(handles.SLM.Mask,handles.SLM.ActiveMaskPath);
         
         handles.SLM.Tar = [];
         handles.SLM.MSE = [];
         SLM_Disp(handles.axes_SLM_Mask, handles.SLM.Mask);
         handles.SLM.MaskProj();
         %%% Update handles structure
         hMainGui = findobj('Name','PLIM_PO2');
         hhMainGui = guidata(hMainGui);
         hhMainGui.SLM = handles.SLM; 
         guidata(hMainGui,hhMainGui);
         guidata(hObject, handles);      
      else
         msgbox('Mask file is not found !');  
      end
   else
      msgbox('Mask file is not found !'); 
   end    
end

function SLM_Disp(ImgHandle, Img)
axes(ImgHandle);
imshow(Img);
colormap(gray);
set(ImgHandle,'Fontsize',8,'OuterPosition',[0.03 0.02 0.75 0.75], 'Position',[0.06 0.13 0.5 0.7]);
axis tight
axis equal

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

function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(hObject);
%%% Close SLM
handles.SLM.Close();
%%% Transfer variables
hMainGui = findobj('Name','PLIM_PO2');
hhMainGui = guidata(hMainGui);
hhMainGui.SLM = handles.SLM;
set(hhMainGui.pushbutton_ExitSLM,'BackgroundColor',[0.94 0.94 0.94]); 
set(hhMainGui.pushbutton_ExitSLM,'string','Init'); 
guidata(hMainGui,hhMainGui);
