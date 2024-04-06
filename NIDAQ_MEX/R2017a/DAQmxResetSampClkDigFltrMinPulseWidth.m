% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkDigFltrMinPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkDigFltrMinPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkDigFltrMinPulseWidth', taskHandle);
end
