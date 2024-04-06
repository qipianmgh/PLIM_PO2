% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILowpassSwitchCapExtClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapExtClkDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapExtClkDiv', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILowpassSwitchCapExtClkDiv', taskHandle, channel, data);
end
