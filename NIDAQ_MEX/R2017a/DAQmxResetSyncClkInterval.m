% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSyncClkInterval(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSyncClkInterval', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSyncClkInterval', taskHandle);
end
