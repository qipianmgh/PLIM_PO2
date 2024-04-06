function [bRet] = DRC(c,iTraceChannelIDs,szAxes,iTraceVariableIDs)
%function [bRet] = DRC(c,iTraceChannelIDs,szAxes,iTraceVariableIDs)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_DRC';
if(strmatch(FunctionName,c.dllfunctions))
	piInValues1 = libpointer('int32Ptr',iTraceChannelIDs);
	piInValues2 = libpointer('int32Ptr',iTraceVariableIDs);
	iInValues3 = zeros(size(iTraceVariableIDs));%dummy for trigger
	piInValues3 = libpointer('int32Ptr',iInValues3);
	try
		[bRet,iTraceChannelIDs,szAxes,iTraceVariableIDs,iInValues3] = calllib(c.libalias,FunctionName,c.ID,piInValues1,szAxes,piInValues2,piInValues3);
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
