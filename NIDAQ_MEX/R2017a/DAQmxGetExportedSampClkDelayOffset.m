% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedSampClkDelayOffset(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedSampClkDelayOffset', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedSampClkDelayOffset', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedSampClkDelayOffset', taskHandle, data);
end
