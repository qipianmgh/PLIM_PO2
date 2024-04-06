% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIAtten(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIAtten', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIAtten', taskHandle, channel);
end
