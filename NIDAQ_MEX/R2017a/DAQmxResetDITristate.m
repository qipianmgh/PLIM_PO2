% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDITristate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDITristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDITristate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDITristate', taskHandle, channel);
end
