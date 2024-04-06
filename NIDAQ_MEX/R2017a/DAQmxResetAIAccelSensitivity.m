% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIAccelSensitivity(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIAccelSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIAccelSensitivity', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIAccelSensitivity', taskHandle, channel);
end
