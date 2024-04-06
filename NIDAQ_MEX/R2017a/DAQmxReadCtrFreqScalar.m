% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, frequency, dutyCycle, reserved] = DAQmxReadCtrFreqScalar(taskHandle, timeout, frequency, dutyCycle, reserved)
    narginchk(5, 5);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrFreqScalar', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrFreqScalar', 'timeout', 2);
    validateattributes(frequency, {'double'}, {'vector'}, 'DAQmxReadCtrFreqScalar', 'frequency', 3);
    validateattributes(dutyCycle, {'double'}, {'vector'}, 'DAQmxReadCtrFreqScalar', 'dutyCycle', 4);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrFreqScalar', 'reserved', 5);
    [status, frequency, dutyCycle, reserved]= mexNIDAQmx('DAQmxReadCtrFreqScalar', taskHandle, timeout, frequency, dutyCycle, reserved);
end
