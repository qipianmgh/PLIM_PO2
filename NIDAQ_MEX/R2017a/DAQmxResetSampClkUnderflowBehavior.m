% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkUnderflowBehavior(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkUnderflowBehavior', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkUnderflowBehavior', taskHandle);
end
