% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDelayFromSampClkDelayUnitsEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetDelayFromSampClkDelayUnitsEx', 'deviceNames', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDelayFromSampClkDelayUnitsEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDelayFromSampClkDelayUnitsEx', taskHandle, deviceNames, data);
end
