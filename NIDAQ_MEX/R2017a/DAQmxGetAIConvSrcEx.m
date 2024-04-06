% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvSrcEx(taskHandle, deviceNames, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvSrcEx', 'deviceNames', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIConvSrcEx', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIConvSrcEx', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvSrcEx', taskHandle, deviceNames, data, bufferSize);
end
