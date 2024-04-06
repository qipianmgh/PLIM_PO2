% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeWatchdogExpirTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeWatchdogExpirTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeWatchdogExpirTrigSrc', taskHandle);
end
