% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILowpassCutoffFreq(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILowpassCutoffFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILowpassCutoffFreq', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILowpassCutoffFreq', taskHandle, channel);
end
