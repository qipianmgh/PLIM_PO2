% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysDevNames(data, bufferSize)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSysDevNames', 'data', 1);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSysDevNames', 'bufferSize', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSysDevNames', data, bufferSize);
end
