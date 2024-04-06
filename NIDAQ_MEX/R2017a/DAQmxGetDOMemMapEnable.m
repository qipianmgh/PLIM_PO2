% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOMemMapEnable', taskHandle, channel, data);
end
