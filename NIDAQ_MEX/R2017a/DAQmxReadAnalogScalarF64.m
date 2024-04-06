% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value, reserved] = DAQmxReadAnalogScalarF64(taskHandle, timeout, value, reserved)
    narginchk(4, 4);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadAnalogScalarF64', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadAnalogScalarF64', 'timeout', 2);
    validateattributes(value, {'double'}, {'vector'}, 'DAQmxReadAnalogScalarF64', 'value', 3);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadAnalogScalarF64', 'reserved', 4);
    [status, value, reserved]= mexNIDAQmx('DAQmxReadAnalogScalarF64', taskHandle, timeout, value, reserved);
end
