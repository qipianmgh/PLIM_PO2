% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedAIConvClkOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAIConvClkOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedAIConvClkOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedAIConvClkOutputTerm', taskHandle, data);
end
