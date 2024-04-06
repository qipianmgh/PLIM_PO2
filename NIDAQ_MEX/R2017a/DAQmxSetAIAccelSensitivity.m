% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAccelSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAccelSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAccelSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIAccelSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAccelSensitivity', taskHandle, channel, data);
end
