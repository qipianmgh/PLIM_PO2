% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, reserved] = DAQmxWriteDigitalScalarU32(taskHandle, autoStart, timeout, value, reserved)
    narginchk(5, 5);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteDigitalScalarU32', 'taskHandle', 1);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalScalarU32', 'autoStart', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteDigitalScalarU32', 'timeout', 3);
    validateattributes(value, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalScalarU32', 'value', 4);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteDigitalScalarU32', 'reserved', 5);
    [status, reserved]= mexNIDAQmx('DAQmxWriteDigitalScalarU32', taskHandle, autoStart, timeout, value, reserved);
end
