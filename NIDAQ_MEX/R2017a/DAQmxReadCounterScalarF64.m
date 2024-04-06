% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value, reserved] = DAQmxReadCounterScalarF64(taskHandle, timeout, value, reserved)
    narginchk(4, 4);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCounterScalarF64', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCounterScalarF64', 'timeout', 2);
    validateattributes(value, {'double'}, {'vector'}, 'DAQmxReadCounterScalarF64', 'value', 3);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCounterScalarF64', 'reserved', 4);
    [status, value, reserved]= mexNIDAQmx('DAQmxReadCounterScalarF64', taskHandle, timeout, value, reserved);
end
