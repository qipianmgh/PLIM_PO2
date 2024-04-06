% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAIConvClkPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAIConvClkPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedAIConvClkPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAIConvClkPulsePolarity', taskHandle, data);
end
