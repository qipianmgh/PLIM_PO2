% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIResolution(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIResolution', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIResolution', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIResolution', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIResolution', taskHandle, channel, data);
end
