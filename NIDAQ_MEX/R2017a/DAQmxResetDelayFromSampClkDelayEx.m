% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDelayFromSampClkDelayEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDelayFromSampClkDelayEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetDelayFromSampClkDelayEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetDelayFromSampClkDelayEx', taskHandle, deviceNames);
end
