% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseFreqDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseFreqDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseFreqDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseFreqDigSyncEnable', taskHandle, channel);
end
