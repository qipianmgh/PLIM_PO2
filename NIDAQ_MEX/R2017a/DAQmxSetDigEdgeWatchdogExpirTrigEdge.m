% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeWatchdogExpirTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigEdgeWatchdogExpirTrigEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeWatchdogExpirTrigEdge', taskHandle, data);
end
