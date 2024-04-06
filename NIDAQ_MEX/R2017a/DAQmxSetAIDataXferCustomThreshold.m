% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIDataXferCustomThreshold(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIDataXferCustomThreshold', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIDataXferCustomThreshold', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIDataXferCustomThreshold', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIDataXferCustomThreshold', taskHandle, channel, data);
end
