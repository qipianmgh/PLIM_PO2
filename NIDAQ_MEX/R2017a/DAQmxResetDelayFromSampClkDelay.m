% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDelayFromSampClkDelay(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDelayFromSampClkDelay', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDelayFromSampClkDelay', taskHandle);
end
