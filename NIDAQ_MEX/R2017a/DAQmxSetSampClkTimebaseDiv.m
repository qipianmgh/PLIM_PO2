% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSampClkTimebaseDiv', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkTimebaseDiv', taskHandle, data);
end
