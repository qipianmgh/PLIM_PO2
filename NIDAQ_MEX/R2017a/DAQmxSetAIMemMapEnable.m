% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIMemMapEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIMemMapEnable', taskHandle, channel, data);
end
