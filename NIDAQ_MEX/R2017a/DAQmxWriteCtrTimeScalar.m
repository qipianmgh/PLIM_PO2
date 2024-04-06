% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, reserved] = DAQmxWriteCtrTimeScalar(taskHandle, autoStart, timeout, highTime, lowTime, reserved)
    narginchk(6, 6);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrTimeScalar', 'taskHandle', 1);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTimeScalar', 'autoStart', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrTimeScalar', 'timeout', 3);
    validateattributes(highTime, {'double'}, {'scalar'}, 'DAQmxWriteCtrTimeScalar', 'highTime', 4);
    validateattributes(lowTime, {'double'}, {'scalar'}, 'DAQmxWriteCtrTimeScalar', 'lowTime', 5);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTimeScalar', 'reserved', 6);
    [status, reserved]= mexNIDAQmx('DAQmxWriteCtrTimeScalar', taskHandle, autoStart, timeout, highTime, lowTime, reserved);
end
