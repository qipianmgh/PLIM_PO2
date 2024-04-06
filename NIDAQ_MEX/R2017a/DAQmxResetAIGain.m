% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIGain(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIGain', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIGain', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIGain', taskHandle, channel);
end
