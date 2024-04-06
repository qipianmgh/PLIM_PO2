% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedSampClkOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSampClkOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedSampClkOutputBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedSampClkOutputBehavior', taskHandle, data);
end
