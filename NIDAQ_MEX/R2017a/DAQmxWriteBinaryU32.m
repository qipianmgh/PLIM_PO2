% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, sampsPerChanWritten, reserved] = DAQmxWriteBinaryU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    narginchk(8, 8);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteBinaryU32', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteBinaryU32', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteBinaryU32', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteBinaryU32', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteBinaryU32', 'dataLayout', 5);
    validateattributes(writeArray, {'uint32'}, {'vector'}, 'DAQmxWriteBinaryU32', 'writeArray', 6);
    validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteBinaryU32', 'sampsPerChanWritten', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteBinaryU32', 'reserved', 8);
    [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteBinaryU32', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
end
