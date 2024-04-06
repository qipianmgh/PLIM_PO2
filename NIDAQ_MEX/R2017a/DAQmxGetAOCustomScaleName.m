% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOCustomScaleName(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOCustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOCustomScaleName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAOCustomScaleName', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAOCustomScaleName', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAOCustomScaleName', taskHandle, channel, data, bufferSize);
end
