% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIMemMapEnable', taskHandle, channel, data);
end
