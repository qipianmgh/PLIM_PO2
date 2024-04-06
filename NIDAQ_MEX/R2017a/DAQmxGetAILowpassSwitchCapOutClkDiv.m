% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILowpassSwitchCapOutClkDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapOutClkDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapOutClkDiv', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILowpassSwitchCapOutClkDiv', taskHandle, channel, data);
end
