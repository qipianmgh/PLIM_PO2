% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDelayFromSampClkDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelay', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDelayFromSampClkDelay', taskHandle, data);
end
