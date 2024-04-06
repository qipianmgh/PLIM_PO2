% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDelayFromSampClkDelayUnitsEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetDelayFromSampClkDelayUnitsEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetDelayFromSampClkDelayUnitsEx', taskHandle, deviceNames);
end
