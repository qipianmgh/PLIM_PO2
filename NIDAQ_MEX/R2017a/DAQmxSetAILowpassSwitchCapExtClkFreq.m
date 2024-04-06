% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapExtClkFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassSwitchCapExtClkFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapExtClkFreq', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassSwitchCapExtClkFreq', taskHandle, channel, data);
end
