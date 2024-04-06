% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetWriteAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetWriteAttribute', taskHandle, attribute);
end
