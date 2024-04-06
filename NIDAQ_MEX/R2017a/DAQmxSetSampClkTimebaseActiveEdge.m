% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkTimebaseActiveEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampClkTimebaseActiveEdge', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkTimebaseActiveEdge', taskHandle, data);
end
