function [bRet] = MAS(c,s1,s2)
% function  [bRet] = MAS(c,s1,s2)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_MAS';
if(strmatch(FunctionName,c.dllfunctions))
	try
		[bRet,s1,s2] = calllib(c.libalias,FunctionName,c.ID,s1,s2);
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
