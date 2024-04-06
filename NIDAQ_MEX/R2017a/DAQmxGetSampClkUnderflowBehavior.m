% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkUnderflowBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkUnderflowBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampClkUnderflowBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkUnderflowBehavior', taskHandle, data);
end
