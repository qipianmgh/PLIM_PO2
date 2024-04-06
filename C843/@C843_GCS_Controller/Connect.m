function c = Connect(c,iValues1)
% function c = Connect(c,iValues1)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

FunctionName = 'C843_Connect';
if(strmatch(FunctionName,c.dllfunctions))
	try
		[c.ID] = calllib(c.libalias,FunctionName,iValues1);
	catch
		rethrow(lasterror);
	end
else
	error(sprintf('%s not found',FunctionName));
end
