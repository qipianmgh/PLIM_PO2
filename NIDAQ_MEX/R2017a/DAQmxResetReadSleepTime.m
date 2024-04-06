% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadSleepTime(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadSleepTime', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadSleepTime', taskHandle);
end
