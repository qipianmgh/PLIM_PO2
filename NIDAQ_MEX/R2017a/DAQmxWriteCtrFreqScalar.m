% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, reserved] = DAQmxWriteCtrFreqScalar(taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
    narginchk(6, 6);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrFreqScalar', 'taskHandle', 1);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrFreqScalar', 'autoStart', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrFreqScalar', 'timeout', 3);
    validateattributes(frequency, {'double'}, {'scalar'}, 'DAQmxWriteCtrFreqScalar', 'frequency', 4);
    validateattributes(dutyCycle, {'double'}, {'scalar'}, 'DAQmxWriteCtrFreqScalar', 'dutyCycle', 5);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrFreqScalar', 'reserved', 6);
    [status, reserved]= mexNIDAQmx('DAQmxWriteCtrFreqScalar', taskHandle, autoStart, timeout, frequency, dutyCycle, reserved);
end
