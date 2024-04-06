% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkTimebaseActiveEdge(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkTimebaseActiveEdge', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkTimebaseActiveEdge', taskHandle);
end
