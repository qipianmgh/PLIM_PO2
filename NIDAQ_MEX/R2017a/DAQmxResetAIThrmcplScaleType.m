% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIThrmcplScaleType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIThrmcplScaleType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIThrmcplScaleType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIThrmcplScaleType', taskHandle, channel);
end
