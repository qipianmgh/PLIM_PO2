% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILowpassSwitchCapExtClkFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapExtClkFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapExtClkFreq', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILowpassSwitchCapExtClkFreq', taskHandle, channel, data);
end
