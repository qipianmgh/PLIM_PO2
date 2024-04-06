% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOMemMapEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOMemMapEnable', taskHandle, channel, data);
end
