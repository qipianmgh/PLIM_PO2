% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqDigSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqDigSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqDigSyncEnable', taskHandle, channel);
end
