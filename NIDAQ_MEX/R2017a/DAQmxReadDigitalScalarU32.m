% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value, reserved] = DAQmxReadDigitalScalarU32(taskHandle, timeout, value, reserved)
    narginchk(4, 4);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadDigitalScalarU32', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadDigitalScalarU32', 'timeout', 2);
    validateattributes(value, {'uint32'}, {'vector'}, 'DAQmxReadDigitalScalarU32', 'value', 3);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadDigitalScalarU32', 'reserved', 4);
    [status, value, reserved]= mexNIDAQmx('DAQmxReadDigitalScalarU32', taskHandle, timeout, value, reserved);
end
