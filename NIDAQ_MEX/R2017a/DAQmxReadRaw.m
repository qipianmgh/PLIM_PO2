% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsRead, numBytesPerSamp, reserved] = DAQmxReadRaw(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
    narginchk(8, 8);
    nargoutchk(5, 5);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadRaw', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadRaw', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadRaw', 'timeout', 3);
    validateattributes(readArray, {'uint32'}, {'vector'}, 'DAQmxReadRaw', 'readArray', 4);
    validateattributes(arraySizeInBytes, {'uint32'}, {'scalar'}, 'DAQmxReadRaw', 'arraySizeInBytes', 5);
    validateattributes(sampsRead, {'int32'}, {'vector'}, 'DAQmxReadRaw', 'sampsRead', 6);
    validateattributes(numBytesPerSamp, {'int32'}, {'vector'}, 'DAQmxReadRaw', 'numBytesPerSamp', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadRaw', 'reserved', 8);
    [status, readArray, sampsRead, numBytesPerSamp, reserved]= mexNIDAQmx('DAQmxReadRaw', taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved);
end
