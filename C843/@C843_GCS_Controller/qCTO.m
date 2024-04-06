function [szAnswer] = qCTO(c,iTriggers,iParams)
%function [szAnswer] = qCTO(c,iTriggers,iParams)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_qCTO';
if(strmatch(FunctionName,c.dllfunctions))
	piParams = libpointer('int32Ptr',iParams);
	piTriggers = libpointer('int32Ptr',iTriggers);
	nValues = length(iTriggers);
	szAnswer = blanks(100);
	try
		[bRet,iTriggers,iParams,szAnswer] = calllib(c.libalias,FunctionName,c.ID,piTriggers,piParams,szAnswer,nValues,99);
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
