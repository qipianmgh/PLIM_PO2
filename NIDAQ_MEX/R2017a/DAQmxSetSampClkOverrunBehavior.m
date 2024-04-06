% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkOverrunBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkOverrunBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampClkOverrunBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkOverrunBehavior', taskHandle, data);
end
