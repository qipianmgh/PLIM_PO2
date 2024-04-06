% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, highTime, lowTime, reserved] = DAQmxReadCtrTimeScalar(taskHandle, timeout, highTime, lowTime, reserved)
    narginchk(5, 5);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrTimeScalar', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrTimeScalar', 'timeout', 2);
    validateattributes(highTime, {'double'}, {'vector'}, 'DAQmxReadCtrTimeScalar', 'highTime', 3);
    validateattributes(lowTime, {'double'}, {'vector'}, 'DAQmxReadCtrTimeScalar', 'lowTime', 4);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrTimeScalar', 'reserved', 5);
    [status, highTime, lowTime, reserved]= mexNIDAQmx('DAQmxReadCtrTimeScalar', taskHandle, timeout, highTime, lowTime, reserved);
end
