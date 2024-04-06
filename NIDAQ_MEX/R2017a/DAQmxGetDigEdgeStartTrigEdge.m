% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeStartTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeStartTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigEdgeStartTrigEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeStartTrigEdge', taskHandle, data);
end
