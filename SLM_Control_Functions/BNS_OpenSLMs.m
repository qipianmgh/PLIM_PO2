%==========================================================================
%=   FUNCTION:  BNS_OpenSLMs()
%=
%=   PURPOSE: Opens all the Boulder Nonlinear Systems SLM driver boards 
%=            in the system.  Assumes the devices are nematic (phase) 
%=            SLMs.  Loads the library "Interface.dll" into the MATLAB
%=            workspace.
%=            
%=   OUTPUTS: 
%=
%==========================================================================
function NumBoards = BNS_OpenSLMs()    
    dll_file = 'E:\Multibeam_software\SLM_Control_Functions\Interface.dll';
    header_file = 'E:\Multibeam_software\SLM_Control_Functions\Interface.h';

    if ~libisloaded('Interface')
       %%% loadlibrary(dll_file, header_file);
       loadlibrary(dll_file, @Interface);
       NumBoards = calllib('Interface', 'Constructor', 1);
       %%%  True Frames for all connect PCIe 16 boards
	   calllib('Interface', 'SetTrueFrames', 3);  
       %%%  The value of True Frames determines how fast the SLM toggles
       %%%  between the true and the inverse image (a necessary procedure that is done to DC balance the SLM).
    else
       NumBoards = calllib('Interface', 'Constructor', 1);  
    end
    % libfunctionsview('Interface')
    