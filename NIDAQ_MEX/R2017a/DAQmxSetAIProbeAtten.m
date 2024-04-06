% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIProbeAtten(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIProbeAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIProbeAtten', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIProbeAtten', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIProbeAtten', taskHandle, channel, data);
end
