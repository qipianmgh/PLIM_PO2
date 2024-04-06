% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILowpassSwitchCapOutClkDiv(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILowpassSwitchCapOutClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILowpassSwitchCapOutClkDiv', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILowpassSwitchCapOutClkDiv', taskHandle, channel);
end
