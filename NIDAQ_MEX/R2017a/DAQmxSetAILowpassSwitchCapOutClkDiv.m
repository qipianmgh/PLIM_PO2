% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapOutClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassSwitchCapOutClkDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapOutClkDiv', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassSwitchCapOutClkDiv', taskHandle, channel, data);
end
