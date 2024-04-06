% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICtrTimebaseDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICtrTimebaseDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICtrTimebaseDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICtrTimebaseDigSyncEnable', taskHandle, channel);
end
