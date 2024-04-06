% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIDigFltrEnable', taskHandle, channel);
end
