% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWatchdogTimeout(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWatchdogTimeout', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWatchdogTimeout', taskHandle);
end
