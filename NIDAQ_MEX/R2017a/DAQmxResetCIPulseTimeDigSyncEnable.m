% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseTimeDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseTimeDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseTimeDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseTimeDigSyncEnable', taskHandle, channel);
end
