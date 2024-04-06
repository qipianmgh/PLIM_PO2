% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeArmStartTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeArmStartTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeArmStartTrigSrc', taskHandle);
end
