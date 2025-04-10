% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvActiveEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvActiveEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvActiveEdge', taskHandle);
end
