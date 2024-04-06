% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILowpassSwitchCapExtClkDiv(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILowpassSwitchCapExtClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILowpassSwitchCapExtClkDiv', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILowpassSwitchCapExtClkDiv', taskHandle, channel);
end
