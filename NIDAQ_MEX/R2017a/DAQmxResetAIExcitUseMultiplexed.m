% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitUseMultiplexed(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitUseMultiplexed', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitUseMultiplexed', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitUseMultiplexed', taskHandle, channel);
end
