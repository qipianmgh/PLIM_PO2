% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth', taskHandle);
end
