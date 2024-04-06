% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkActiveEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkActiveEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampClkActiveEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkActiveEdge', taskHandle, data);
end
