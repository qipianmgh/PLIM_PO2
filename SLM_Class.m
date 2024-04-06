classdef SLM_Class  < handle
    properties 
        UsageStatus
        NumBoards
        LutFilePath
        CalFilePath
        ActiveMaskPath
        ImageBuffer
        
        VortexCharge
        VortexChargeListAcq
        GratingPeriod
        GratingPeriodList
        CenterPosX
        CenterPosY
        CenterMoveStep
        Mask
    end
    
    methods
        
        function obj = SLM_Class()
            obj.UsageStatus = 0;  %%%  0: Off 1: Vortex 2: Multibeam Cali 3: Multibeam
            obj.NumBoards = 1;
            obj.LutFilePath = 'E:\PLIM_PO2\SLM_Control_Functions\LUT_Files\Calibrated_04052021_Fit\slm4289_at950_20210405_222556.lut';
            obj.CalFilePath = 'E:\PLIM_PO2\SLM_Control_Functions\WFC_Files\512white.tiff';
            obj.ActiveMaskPath = 'E:\PLIM_PO2\SLM_Control_Functions\Masks\VortexMaskActive.tiff';
            obj.ImageBuffer = libpointer('uint8Ptr', zeros(524288,1)); %%% 512 x 512 x 2 bytes
            
            obj.VortexCharge = 0;
            obj.VortexChargeListAcq = [0];
            obj.GratingPeriod = 16; 
            obj.GratingPeriodList = [8 16 Inf];
            obj.CenterPosX = 0;
            obj.CenterPosY = 0;
            obj.CenterMoveStep = 1;
            obj.Mask = [];
        end        
        
        function Init(obj) 
            %%% Call the constructor, which opens a handle to the hardware 
            obj.NumBoards = BNS_OpenSLMs();  
            %%% Load a LUT file to each PCIe board
            BNS_LoadLUTFile(1, obj.LutFilePath);
            %%% Read in the wavefront correction file for each SLM
            BNS_ReadTIFF(obj.CalFilePath, obj.ImageBuffer);
            BNS_WriteCal(obj.ImageBuffer);
            %%% Turn on SLM power
            BNS_SetPower(1);
            %%% Read images into memory
            BNS_ReadTIFF(obj.ActiveMaskPath, obj.ImageBuffer);
            BNS_WriteImage(obj.ImageBuffer);
            obj.UsageStatus = 1;
        end    
        
        %%% Project mask on SLM
        function MaskProj(obj)
            BNS_ReadTIFF(obj.ActiveMaskPath, obj.ImageBuffer);
            BNS_WriteImage(obj.ImageBuffer);
        end
        
        function Close(obj)
            BNS_SetPower(0);
            BNS_CloseSLM();
            obj.UsageStatus = 0;
        end
    end
    
end
