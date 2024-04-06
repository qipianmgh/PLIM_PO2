% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetTrigAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetTrigAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetTrigAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetTrigAttribute', taskHandle, attribute);
end
