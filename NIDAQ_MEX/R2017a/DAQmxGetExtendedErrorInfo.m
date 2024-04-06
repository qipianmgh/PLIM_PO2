% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, errorString] = DAQmxGetExtendedErrorInfo(errorString, bufferSize)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(errorString, {'char'}, {'vector'}, 'DAQmxGetExtendedErrorInfo', 'errorString', 1);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExtendedErrorInfo', 'bufferSize', 2);
    [status, errorString]= mexNIDAQmx('DAQmxGetExtendedErrorInfo', errorString, bufferSize);
end
