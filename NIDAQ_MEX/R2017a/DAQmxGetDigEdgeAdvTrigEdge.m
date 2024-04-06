% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeAdvTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeAdvTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigEdgeAdvTrigEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeAdvTrigEdge', taskHandle, data);
end
