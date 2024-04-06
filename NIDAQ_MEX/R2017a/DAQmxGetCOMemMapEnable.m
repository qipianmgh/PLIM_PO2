% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOMemMapEnable', taskHandle, channel, data);
end
