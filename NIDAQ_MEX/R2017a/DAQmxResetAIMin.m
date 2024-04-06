% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIMin(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIMin', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIMin', taskHandle, channel);
end
