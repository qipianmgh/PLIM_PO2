% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIDataXferCustomThreshold(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIDataXferCustomThreshold', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIDataXferCustomThreshold', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIDataXferCustomThreshold', taskHandle, channel);
end
