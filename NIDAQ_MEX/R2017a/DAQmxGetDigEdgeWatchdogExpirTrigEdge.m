% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeWatchdogExpirTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigEdgeWatchdogExpirTrigEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeWatchdogExpirTrigEdge', taskHandle, data);
end
