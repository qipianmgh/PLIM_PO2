% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadDigitalU8(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(8, 8);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadDigitalU8', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadDigitalU8', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadDigitalU8', 'timeout', 3);
    validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadDigitalU8', 'fillMode', 4);
    validateattributes(readArray, {'uint8'}, {'vector'}, 'DAQmxReadDigitalU8', 'readArray', 5);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadDigitalU8', 'arraySizeInSamps', 6);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadDigitalU8', 'sampsPerChanRead', 7);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadDigitalU8', 'reserved', 8);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadDigitalU8', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
