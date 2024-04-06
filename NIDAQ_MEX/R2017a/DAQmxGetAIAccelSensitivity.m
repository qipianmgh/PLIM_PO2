% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAccelSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAccelSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAccelSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIAccelSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAccelSensitivity', taskHandle, channel, data);
end
