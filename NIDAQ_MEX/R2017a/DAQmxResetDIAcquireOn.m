% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIAcquireOn(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIAcquireOn', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIAcquireOn', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIAcquireOn', taskHandle, channel);
end
