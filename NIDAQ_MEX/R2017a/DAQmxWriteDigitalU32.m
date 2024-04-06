% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, sampsPerChanWritten, reserved] = DAQmxWriteDigitalU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    narginchk(8, 8);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteDigitalU32', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteDigitalU32', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalU32', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteDigitalU32', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalU32', 'dataLayout', 5);
    validateattributes(writeArray, {'uint32'}, {'vector'}, 'DAQmxWriteDigitalU32', 'writeArray', 6);
    validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteDigitalU32', 'sampsPerChanWritten', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteDigitalU32', 'reserved', 8);
    [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteDigitalU32', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
end
