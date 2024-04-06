% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOTristate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOTristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOTristate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOTristate', taskHandle, channel);
end
