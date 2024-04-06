% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, highTicks, lowTicks, reserved] = DAQmxReadCtrTicksScalar(taskHandle, timeout, highTicks, lowTicks, reserved)
    narginchk(5, 5);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrTicksScalar', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrTicksScalar', 'timeout', 2);
    validateattributes(highTicks, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicksScalar', 'highTicks', 3);
    validateattributes(lowTicks, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicksScalar', 'lowTicks', 4);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicksScalar', 'reserved', 5);
    [status, highTicks, lowTicks, reserved]= mexNIDAQmx('DAQmxReadCtrTicksScalar', taskHandle, timeout, highTicks, lowTicks, reserved);
end
