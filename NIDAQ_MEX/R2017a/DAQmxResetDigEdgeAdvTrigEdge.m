% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeAdvTrigEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeAdvTrigEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeAdvTrigEdge', taskHandle);
end
