% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, sampsPerChanWritten, reserved] = DAQmxWriteDigitalU8(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    narginchk(8, 8);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteDigitalU8', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteDigitalU8', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalU8', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteDigitalU8', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalU8', 'dataLayout', 5);
    validateattributes(writeArray, {'uint8'}, {'vector'}, 'DAQmxWriteDigitalU8', 'writeArray', 6);
    validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteDigitalU8', 'sampsPerChanWritten', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteDigitalU8', 'reserved', 8);
    [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteDigitalU8', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
end
