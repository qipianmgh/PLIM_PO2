% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvActiveEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvActiveEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIConvActiveEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvActiveEdge', taskHandle, data);
end
