% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIThrmstrR1(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIThrmstrR1', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIThrmstrR1', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIThrmstrR1', taskHandle, channel);
end
