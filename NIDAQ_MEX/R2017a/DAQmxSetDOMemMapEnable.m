% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOMemMapEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOMemMapEnable', taskHandle, channel, data);
end
