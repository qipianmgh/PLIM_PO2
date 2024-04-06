% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeRefTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeRefTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigEdgeRefTrigEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeRefTrigEdge', taskHandle, data);
end
