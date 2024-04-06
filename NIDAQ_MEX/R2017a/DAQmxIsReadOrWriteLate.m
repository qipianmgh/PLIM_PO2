% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxIsReadOrWriteLate(errorCode)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(errorCode, {'int32'}, {'scalar'}, 'DAQmxIsReadOrWriteLate', 'errorCode', 1);
    [status]= mexNIDAQmx('DAQmxIsReadOrWriteLate', errorCode);
end
