% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth', taskHandle);
end
