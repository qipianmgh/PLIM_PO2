% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeAdvTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeAdvTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigEdgeAdvTrigEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeAdvTrigEdge', taskHandle, data);
end
