% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIDCOffset(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIDCOffset', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIDCOffset', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIDCOffset', taskHandle, channel);
end
