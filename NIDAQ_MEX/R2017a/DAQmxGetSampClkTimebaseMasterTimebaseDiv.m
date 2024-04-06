% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSampClkTimebaseMasterTimebaseDiv', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkTimebaseMasterTimebaseDiv', taskHandle, data);
end
