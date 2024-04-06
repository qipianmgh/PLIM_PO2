% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvActiveEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvActiveEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIConvActiveEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvActiveEdge', taskHandle, data);
end
