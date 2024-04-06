% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadBinaryI32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(8, 8);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadBinaryI32', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadBinaryI32', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadBinaryI32', 'timeout', 3);
    validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI32', 'fillMode', 4);
    validateattributes(readArray, {'int32'}, {'vector'}, 'DAQmxReadBinaryI32', 'readArray', 5);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI32', 'arraySizeInSamps', 6);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadBinaryI32', 'sampsPerChanRead', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadBinaryI32', 'reserved', 8);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadBinaryI32', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
