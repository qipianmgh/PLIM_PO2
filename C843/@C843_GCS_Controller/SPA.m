function [bRet] = SPA(c,szAxes,iInParamIDs,dInValues,szInString)
%function [bRet] = SPA(c,szAxes,iInParamIDs,dInValues,szInString)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_SPA';
if(strmatch(FunctionName,c.dllfunctions))
	if(nargin<5),szInString = '';end,
	piInParIDs = libpointer('int32Ptr',iInParamIDs);
	pdInValues = libpointer('doublePtr',dInValues);
	try
		[bRet,szAxes,iInParamIDs,dInValues,szInString] = calllib(c.libalias,FunctionName,c.ID,szAxes,piInParIDs,pdInValues,szInString);
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
