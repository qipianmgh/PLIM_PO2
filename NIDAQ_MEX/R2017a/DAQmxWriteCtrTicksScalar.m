% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, reserved] = DAQmxWriteCtrTicksScalar(taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
    narginchk(6, 6);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrTicksScalar', 'taskHandle', 1);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTicksScalar', 'autoStart', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrTicksScalar', 'timeout', 3);
    validateattributes(highTicks, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTicksScalar', 'highTicks', 4);
    validateattributes(lowTicks, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTicksScalar', 'lowTicks', 5);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTicksScalar', 'reserved', 6);
    [status, reserved]= mexNIDAQmx('DAQmxWriteCtrTicksScalar', taskHandle, autoStart, timeout, highTicks, lowTicks, reserved);
end
