% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeWatchdogExpirTrigEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeWatchdogExpirTrigEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeWatchdogExpirTrigEdge', taskHandle);
end
