% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth', taskHandle);
end
