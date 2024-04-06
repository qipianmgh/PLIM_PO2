% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRealTimeAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRealTimeAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetRealTimeAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetRealTimeAttribute', taskHandle, attribute);
end
