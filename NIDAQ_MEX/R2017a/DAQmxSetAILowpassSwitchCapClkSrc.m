% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapClkSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassSwitchCapClkSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAILowpassSwitchCapClkSrc', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassSwitchCapClkSrc', taskHandle, channel, data);
end
