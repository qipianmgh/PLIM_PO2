% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapExtClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassSwitchCapExtClkDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapExtClkDiv', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassSwitchCapExtClkDiv', taskHandle, channel, data);
end
