% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinStartTrigDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinStartTrigDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinStartTrigDigSyncEnable', taskHandle);
end
