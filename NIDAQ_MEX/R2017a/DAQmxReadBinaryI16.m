% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadBinaryI16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(8, 8);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadBinaryI16', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadBinaryI16', 'timeout', 3);
    validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'fillMode', 4);
    validateattributes(readArray, {'int16'}, {'vector'}, 'DAQmxReadBinaryI16', 'readArray', 5);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'arraySizeInSamps', 6);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadBinaryI16', 'sampsPerChanRead', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadBinaryI16', 'reserved', 8);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadBinaryI16', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
