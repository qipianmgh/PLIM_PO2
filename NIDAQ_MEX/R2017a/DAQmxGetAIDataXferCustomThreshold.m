% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDataXferCustomThreshold(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDataXferCustomThreshold', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDataXferCustomThreshold', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIDataXferCustomThreshold', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIDataXferCustomThreshold', taskHandle, channel, data);
end
