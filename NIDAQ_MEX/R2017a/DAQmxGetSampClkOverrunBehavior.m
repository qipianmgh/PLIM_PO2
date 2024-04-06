% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkOverrunBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkOverrunBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampClkOverrunBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkOverrunBehavior', taskHandle, data);
end
