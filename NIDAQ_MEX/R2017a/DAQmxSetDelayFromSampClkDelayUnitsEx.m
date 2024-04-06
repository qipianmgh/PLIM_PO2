% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayUnitsEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetDelayFromSampClkDelayUnitsEx', 'deviceNames', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayUnitsEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDelayFromSampClkDelayUnitsEx', taskHandle, deviceNames, data);
end
