% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDelayFromSampClkDelayEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetDelayFromSampClkDelayEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDelayFromSampClkDelayEx', taskHandle, deviceNames, data);
end
