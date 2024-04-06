% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetBufferAttribute(taskHandle, attribute, value)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufferAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxGetBufferAttribute', 'attribute', 2);
    validateattributes(value, {'uint32'}, {'vector'}, 'DAQmxGetBufferAttribute', 'value', 3);
    [status, value]= mexNIDAQmx('DAQmxGetBufferAttribute', taskHandle, attribute, value);
end
