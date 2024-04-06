% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkActiveEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkActiveEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkActiveEdge', taskHandle);
end
