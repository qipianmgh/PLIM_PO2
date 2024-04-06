% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetBufferAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetBufferAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetBufferAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetBufferAttribute', taskHandle, attribute);
end
