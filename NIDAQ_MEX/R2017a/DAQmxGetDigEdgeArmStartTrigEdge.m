% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeArmStartTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigEdgeArmStartTrigEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeArmStartTrigEdge', taskHandle, data);
end
