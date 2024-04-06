% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIMemMapEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIMemMapEnable', taskHandle, channel, data);
end
