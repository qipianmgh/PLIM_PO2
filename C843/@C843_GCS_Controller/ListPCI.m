function c = ListPCI(c,szHostName,nPort)
%function c = ListPCI(c,szHostName,nPort)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

FunctionName = 'C843_ListPCI';
if(strmatch(FunctionName,c.dllfunctions))
	try
		[c.ID] = calllib(c.libalias,FunctionName,szHostName,nPort);
		if(c.ID<0)
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
