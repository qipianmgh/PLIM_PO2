% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIMemMapEnable', taskHandle, channel, data);
end
