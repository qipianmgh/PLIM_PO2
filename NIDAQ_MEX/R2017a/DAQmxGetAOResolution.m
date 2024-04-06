% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOResolution(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOResolution', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOResolution', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOResolution', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOResolution', taskHandle, channel, data);
end
