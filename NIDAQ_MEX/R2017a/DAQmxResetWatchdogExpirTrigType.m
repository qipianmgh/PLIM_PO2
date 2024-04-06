% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWatchdogExpirTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWatchdogExpirTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWatchdogExpirTrigType', taskHandle);
end
