% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIExcitUseMultiplexed(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIExcitUseMultiplexed', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIExcitUseMultiplexed', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIExcitUseMultiplexed', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIExcitUseMultiplexed', taskHandle, channel, data);
end
