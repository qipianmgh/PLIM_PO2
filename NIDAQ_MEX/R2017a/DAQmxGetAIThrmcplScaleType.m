% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmcplScaleType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmcplScaleType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplScaleType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIThrmcplScaleType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmcplScaleType', taskHandle, channel, data);
end
