% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAIConvClkOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAIConvClkOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAIConvClkOutputTerm', taskHandle);
end
