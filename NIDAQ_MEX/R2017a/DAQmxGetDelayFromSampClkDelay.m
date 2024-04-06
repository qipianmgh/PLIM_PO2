% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDelayFromSampClkDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDelayFromSampClkDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDelayFromSampClkDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDelayFromSampClkDelay', taskHandle, data);
end
