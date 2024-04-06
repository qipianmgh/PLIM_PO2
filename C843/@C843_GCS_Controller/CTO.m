function bRet = CTO(c,iValues1,iValues2,szAxes)
% function bRet = CTO(c,iValues1,iValues2,szAxes)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'C843_CTO';
if(strmatch(FunctionName,c.dllfunctions))
	piValues1 = libpointer('int32Ptr',iValues1);
	piValues2 = libpointer('int32Ptr',iValues2);
	iValues3 = length(iValues2);
	try
		[bRet,piValues1,piValues2,szAxes] = calllib(c.libalias,FunctionName,c.ID,piValues1,piValues2,szAxes,iValues3);
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
