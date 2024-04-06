% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadCounterU32(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(7, 7);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCounterU32', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadCounterU32', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCounterU32', 'timeout', 3);
    validateattributes(readArray, {'uint32'}, {'vector'}, 'DAQmxReadCounterU32', 'readArray', 4);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadCounterU32', 'arraySizeInSamps', 5);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadCounterU32', 'sampsPerChanRead', 6);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCounterU32', 'reserved', 7);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadCounterU32', taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
