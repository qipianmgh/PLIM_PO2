% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIDigSyncEnable', taskHandle, channel);
end
