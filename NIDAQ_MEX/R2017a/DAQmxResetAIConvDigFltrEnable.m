% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigFltrEnable', taskHandle);
end
