% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIMemMapEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIMemMapEnable', taskHandle, channel, data);
end
