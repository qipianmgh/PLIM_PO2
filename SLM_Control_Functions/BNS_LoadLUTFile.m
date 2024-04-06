%==========================================================================
%=   FUNCTION: BNS_LoadLUTFile(LUTFileName)
%=
%=   PURPOSE: Calls a C++ sub-function to read and loads the LUT to the
%             hardware
%=
%=   INPUTS:  The PCIe board that the LUT is being written to, and the 
%=            LUT File Name
%=
%=   OUTPUTS:  none
%=
%==========================================================================
function BNS_LoadLUTFile(board, LUTFileName)
    calllib('Interface', 'LoadLUTFile', board, LUTFileName);