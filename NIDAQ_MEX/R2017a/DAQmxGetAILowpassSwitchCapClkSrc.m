% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILowpassSwitchCapClkSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapClkSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAILowpassSwitchCapClkSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILowpassSwitchCapClkSrc', taskHandle, channel, data);
end
