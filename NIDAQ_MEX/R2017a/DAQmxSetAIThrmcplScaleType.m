% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmcplScaleType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmcplScaleType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmcplScaleType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIThrmcplScaleType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmcplScaleType', taskHandle, channel, data);
end
