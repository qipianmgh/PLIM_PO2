% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesCountDirDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesCountDirDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesCountDirDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesCountDirDigSyncEnable', taskHandle, channel);
end
