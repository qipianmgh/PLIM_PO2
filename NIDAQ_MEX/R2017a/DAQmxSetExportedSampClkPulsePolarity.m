% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedSampClkPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSampClkPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedSampClkPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedSampClkPulsePolarity', taskHandle, data);
end
