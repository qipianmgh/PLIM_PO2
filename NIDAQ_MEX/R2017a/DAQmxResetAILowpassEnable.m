% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILowpassEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILowpassEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILowpassEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILowpassEnable', taskHandle, channel);
end
