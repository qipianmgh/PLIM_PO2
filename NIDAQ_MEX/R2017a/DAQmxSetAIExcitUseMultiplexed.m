% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitUseMultiplexed(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitUseMultiplexed', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitUseMultiplexed', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIExcitUseMultiplexed', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitUseMultiplexed', taskHandle, channel, data);
end
