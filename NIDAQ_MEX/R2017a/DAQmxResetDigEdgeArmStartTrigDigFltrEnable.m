% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeArmStartTrigDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeArmStartTrigDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeArmStartTrigDigFltrEnable', taskHandle);
end
