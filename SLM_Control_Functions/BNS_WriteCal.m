%==========================================================================
%=   FUNCTION:   BNS_WriteCal(ImageMatrix, handles)
%=
%=   PURPOSE:    Loads a calibration image onto on the SLM driver board.
%=             
%=   INPUTS:     ImageMatrix
%=
%=   OUTPUTS:  
%=
%==========================================================================
% function BNS_WriteCal(pImageBuffer, handles)        
% 	calllib('Interface', 'WriteCal', 1, pImageBuffer);

function BNS_WriteCal(pImageBuffer)        
	calllib('Interface', 'WriteCal', 1, pImageBuffer);