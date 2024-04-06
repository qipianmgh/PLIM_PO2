% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkOverrunBehavior(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkOverrunBehavior', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkOverrunBehavior', taskHandle);
end
