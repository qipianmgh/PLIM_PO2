% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedSampClkDelayOffset(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSampClkDelayOffset', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetExportedSampClkDelayOffset', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedSampClkDelayOffset', taskHandle, data);
end
