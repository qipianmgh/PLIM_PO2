% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedSampClkOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedSampClkOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedSampClkOutputBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedSampClkOutputBehavior', taskHandle, data);
end
