%==========================================================================
%=   FUNCTION:   BNS_WriteImage(ImageMatrix, handles)
%=
%=   PURPOSE:    Loads a image onto on the SLM driver board.
%=             
%=   INPUTS:     ImageMatrix
%=
%=   OUTPUTS:  
%=
%==========================================================================
% function BNS_WriteImage(pImageBuffer, handles)        
% 	calllib('Interface', 'WriteImage', 1, pImageBuffer);

function BNS_WriteImage(pImageBuffer)        
	calllib('Interface', 'WriteImage', 1, pImageBuffer);