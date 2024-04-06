% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSampClkTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSampClkTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkTimebaseSrc', taskHandle, data, bufferSize);
end
