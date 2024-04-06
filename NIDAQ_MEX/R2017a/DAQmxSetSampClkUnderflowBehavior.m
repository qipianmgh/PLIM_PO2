% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkUnderflowBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkUnderflowBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampClkUnderflowBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkUnderflowBehavior', taskHandle, data);
end
