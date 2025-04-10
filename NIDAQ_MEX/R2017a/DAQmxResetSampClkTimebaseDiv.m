% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkTimebaseDiv(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkTimebaseDiv', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkTimebaseDiv', taskHandle);
end
