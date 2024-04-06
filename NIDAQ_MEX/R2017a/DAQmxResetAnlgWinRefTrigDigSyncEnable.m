% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinRefTrigDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinRefTrigDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinRefTrigDigSyncEnable', taskHandle);
end
