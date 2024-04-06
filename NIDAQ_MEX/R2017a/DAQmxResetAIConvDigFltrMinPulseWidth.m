% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigFltrMinPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigFltrMinPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigFltrMinPulseWidth', taskHandle);
end
