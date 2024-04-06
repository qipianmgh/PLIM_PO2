%==========================================================================
%=   FUNCTION: BNS_ReadTIFF(TIFFFileName)
%=
%=   PURPOSE: Calls a C++ sub-function to read a TIFF file into memory
%=
%=   INPUTS:  The file name and matrix to store the image into
%=
%=   OUTPUTS:  none
%=
%==========================================================================
function BNS_ReadTIFF(TIFFFileName, pImageBuffer)
    calllib('Interface', 'ReadTIFF', TIFFFileName, pImageBuffer);