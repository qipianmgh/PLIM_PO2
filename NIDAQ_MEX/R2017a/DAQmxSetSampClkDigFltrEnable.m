% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSampClkDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkDigFltrEnable', taskHandle, data);
end
