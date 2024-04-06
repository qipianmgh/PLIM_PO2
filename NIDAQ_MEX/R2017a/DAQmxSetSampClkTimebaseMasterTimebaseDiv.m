% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSampClkTimebaseMasterTimebaseDiv', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkTimebaseMasterTimebaseDiv', taskHandle, data);
end
