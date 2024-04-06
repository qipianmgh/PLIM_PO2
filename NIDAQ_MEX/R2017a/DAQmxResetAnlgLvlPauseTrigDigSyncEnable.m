% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgLvlPauseTrigDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgLvlPauseTrigDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgLvlPauseTrigDigSyncEnable', taskHandle);
end
