% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArray, sampsPerChanRead, reserved] = DAQmxReadCounterF64(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(7, 7);
    nargoutchk(4, 4);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCounterF64', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadCounterF64', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCounterF64', 'timeout', 3);
    validateattributes(readArray, {'double'}, {'vector'}, 'DAQmxReadCounterF64', 'readArray', 4);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadCounterF64', 'arraySizeInSamps', 5);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadCounterF64', 'sampsPerChanRead', 6);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCounterF64', 'reserved', 7);
    [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadCounterF64', taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end
