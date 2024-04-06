% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkDigSyncEnable', taskHandle);
end
