% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOMemMapEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOMemMapEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAOMemMapEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOMemMapEnable', taskHandle, channel, data);
end
