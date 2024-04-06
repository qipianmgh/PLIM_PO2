function [bRet] = JAX(c,iJoyID,iJoyAxesID,sAxisNames)
%function [bRet] = JAX(c,iJoyID,iJoyAxesID,sAxisNames)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_JAX';
if(strmatch(FunctionName,c.dllfunctions))
	try
		[bRet,sAxisNames] = calllib(c.libalias,FunctionName,c.ID,iJoyID,iJoyAxesID,sAxisNames);
		if(bRet==0)
			iError = GetError(c);
			szDesc = TranslateError(c,iError);
			error(szDesc);
		end
	catch
		rethrow(lasterror);
	end
else
	error(sprintf('%s not found',FunctionName));
end
