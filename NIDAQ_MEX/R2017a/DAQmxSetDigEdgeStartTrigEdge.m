% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeStartTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeStartTrigEdge', taskHandle, data);
end
