% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetImplicitUnderflowBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetImplicitUnderflowBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetImplicitUnderflowBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetImplicitUnderflowBehavior', taskHandle, data);
end
