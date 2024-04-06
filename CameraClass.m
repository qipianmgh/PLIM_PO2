classdef CameraClass < handle
    
    properties
        BitDepthOption
        BitDepth
        BaslerVid
        BaslerSrc
        SeqTrigStatus
        StreamStatus
        SavePath
        SaveFilename
        UsageStatus
    end
    
    methods     
        function obj = CameraClass()
            %%% Camera setting
            obj.BitDepthOption = {'Mono8','Mono10'};
            obj.BitDepth = 'Mono8';    %%%  1: Mono8; 2: 'Mono10';
            obj.StreamStatus = logical(0);
            obj.SeqTrigStatus = logical(0);
            %%% Camera save info
            SavePathRoot = 'E:\Data\';
            listing = dir(SavePathRoot);
            SaveFolder = ['Data_', datestr(now,'yyyy-mm-dd')];
            if isempty(find(ismember({listing.name},SaveFolder)))
               mkdir('E:\Data\',SaveFolder);
            else
            end
            obj.SavePath = [SavePathRoot,SaveFolder,'\'];
            listing2 = ls([obj.SavePath, '*.tiff']);
            if ~isempty(listing2)
               Filename_num = str2num(listing2(size(listing2,1),8:11))+1;
               obj.SaveFilename = ['BaslerCamera_',num2str(Filename_num,'%04d')];
            else
               obj.SaveFilename = 'BaslerCamera_0001';
            end
            obj.UsageStatus = 0;
        end
        
        function Init(obj)
            obj.BaslerVid = videoinput('gentl', 1, obj.BitDepth);
            obj.BaslerSrc = getselectedsource(obj.BaslerVid);
            obj.BaslerVid.LoggingMode = 'memory';
            triggerconfig(obj.BaslerVid, 'immediate');
            obj.BaslerVid.TriggerRepeat = 0;
            obj.BaslerVid.FramesPerTrigger = 1;
            obj.BaslerSrc.AcquisitionFrameRate = 10;
            obj.BaslerSrc.AcquisitionFrameRateEnable = 'True';
            obj.BaslerSrc.AcquisitionBurstFrameCount = 1;
            obj.BaslerVid.ROIPosition = [0 0 1280 1024];
            
            obj.BaslerSrc.TriggerSelector = 'FrameStart';
            obj.BaslerSrc.ExposureMode = 'Timed';
            obj.BaslerSrc.BinningHorizontal = 1;  %%%  1---4
            obj.BaslerSrc.BinningVertical = 1;    %%%  1---4
            obj.BaslerSrc.GainAuto = 'Off';
            obj.BaslerSrc.Gain = 0;      %%%  0---12
            obj.BaslerSrc.BlackLevel = uint8(0);   %%% 0---255 for 10 bit; 0---63.75 for 8 bit
            obj.BaslerSrc.ExposureAuto = 'Off';
            obj.BaslerSrc.ExposureTime = uint32(1e4); %%% us  59---1e6
            obj.BaslerSrc.TriggerSelector = 'FrameBurstStart';
            obj.BaslerSrc.TriggerSource = 'Line4';
            obj.BaslerSrc.TriggerDelay = 0;
            obj.BaslerSrc.TriggerActivation = 'RisingEdge';  %%% RisingEdge  FallingEdge
            obj.BaslerSrc.TriggerMode = 'Off'; 
            obj.UsageStatus = 1;
        end
               
        function Close(obj)
            delete(obj.BaslerVid);
            obj.UsageStatus = 0;
        end
    end  
end

