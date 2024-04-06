% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSampClkTimebaseDiv', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkTimebaseDiv', taskHandle, data);
end
