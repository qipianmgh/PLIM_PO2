% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadBinaryU16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(8, 8);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadBinaryU16', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadBinaryU16', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadBinaryU16', 'timeout', 3);
    validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryU16', 'fillMode', 4);
    validateattributes(readArray, {'uint16'}, {'vector'}, 'DAQmxReadBinaryU16', 'readArray', 5);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryU16', 'arraySizeInSamps', 6);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadBinaryU16', 'sampsPerChanRead', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadBinaryU16', 'reserved', 8);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadBinaryU16', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
