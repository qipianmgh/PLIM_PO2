% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIProbeAtten(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIProbeAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIProbeAtten', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIProbeAtten', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIProbeAtten', taskHandle, channel, data);
end
