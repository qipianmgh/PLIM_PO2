% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDIMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIMemMapEnable', taskHandle, channel, data);
end
