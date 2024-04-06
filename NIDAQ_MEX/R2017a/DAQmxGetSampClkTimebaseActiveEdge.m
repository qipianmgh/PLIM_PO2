% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkTimebaseActiveEdge(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampClkTimebaseActiveEdge', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkTimebaseActiveEdge', taskHandle, data);
end
