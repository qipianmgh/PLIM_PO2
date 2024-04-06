% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIThrmstrC(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIThrmstrC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIThrmstrC', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIThrmstrC', taskHandle, channel);
end
