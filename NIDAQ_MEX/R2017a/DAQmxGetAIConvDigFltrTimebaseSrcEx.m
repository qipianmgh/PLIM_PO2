% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseSrcEx', 'deviceNames', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseSrcEx', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseSrcEx', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrTimebaseSrcEx', taskHandle, deviceNames, data, bufferSize);
end
