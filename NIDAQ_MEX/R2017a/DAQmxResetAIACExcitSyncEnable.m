% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIACExcitSyncEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIACExcitSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIACExcitSyncEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIACExcitSyncEnable', taskHandle, channel);
end
