% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetImplicitUnderflowBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetImplicitUnderflowBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetImplicitUnderflowBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetImplicitUnderflowBehavior', taskHandle, data);
end
