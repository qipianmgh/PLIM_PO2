% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, writeArray, sampsPerChanWritten, reserved] = DAQmxWriteRaw(taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
    narginchk(7, 7);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteRaw', 'taskHandle', 1);
    validateattributes(numSamps, {'int32'}, {'scalar'}, 'DAQmxWriteRaw', 'numSamps', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteRaw', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteRaw', 'timeout', 4);
    validateattributes(writeArray, {'uint32'}, {'vector'}, 'DAQmxWriteRaw', 'writeArray', 5);
    validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteRaw', 'sampsPerChanWritten', 6);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteRaw', 'reserved', 7);
    [status, writeArray, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteRaw', taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved);
end
