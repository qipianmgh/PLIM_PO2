% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIProbeAtten(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIProbeAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIProbeAtten', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIProbeAtten', taskHandle, channel);
end
