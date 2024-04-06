% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeArmStartTrigEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeArmStartTrigEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeArmStartTrigEdge', taskHandle);
end
