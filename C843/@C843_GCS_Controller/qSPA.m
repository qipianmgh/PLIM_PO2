function [dOutValues1,szAnswer] = qSPA(c,szAxes,iInParamIDs)
%function [dOutValues1,szAnswer] = qSPA(c,szAxes,iInParamIDs)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_qSPA';
if(strmatch(FunctionName,c.dllfunctions))
	piInPars = libpointer('int32Ptr',iInParamIDs);
	dOutValues1 = zeros(size(iInParamIDs));
	pdOutValues1 = libpointer('doublePtr',dOutValues1);
	szAnswer = blanks(1001);
	try
		[bRet,szAxes,iInParamIDs,dOutValues1,szAnswer] = calllib(c.libalias,FunctionName,c.ID,szAxes,piInPars,pdOutValues1,szAnswer,1000);
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
