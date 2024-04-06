% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeArmStartTrigEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigEdge', taskHandle, data);
end
