function [szSourceIds,iRecordOptions] = qDRC(c,iRecordTables)
%function [szSourceIds,iRecordOptions] = qDRC(c,iRecordTables)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_qDRC';
if(strmatch(FunctionName,c.dllfunctions))
	piRecordTables = libpointer('int32Ptr',iRecordTables);
	iRecordOptions = zeros(size(iRecordTables));
	piRecordOptions = libpointer('int32Ptr',iRecordOptions);
	iTriggerOptions = zeros(size(iRecordTables));
	piTriggerOptions = libpointer('int32Ptr',iTriggerOptions);
	nValues = length(iRecordTables);
	szSourceIds = blanks(1001);
	try
		[bRet,iRecordTables,szSourceIds,iRecordOptions,iTriggerOptions] = calllib(c.libalias,FunctionName,c.ID,piRecordTables,szSourceIds,piRecordOptions,piTriggerOptions,nValues);
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
