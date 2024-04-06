% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArrayHighTime, readArrayLowTime, sampsPerChanRead, reserved] = DAQmxReadCtrTime(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(9, 9);
    nargoutchk(5, 5);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrTime', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadCtrTime', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrTime', 'timeout', 3);
    validateattributes(interleaved, {'uint32'}, {'scalar'}, 'DAQmxReadCtrTime', 'interleaved', 4);
    validateattributes(readArrayHighTime, {'double'}, {'vector'}, 'DAQmxReadCtrTime', 'readArrayHighTime', 5);
    validateattributes(readArrayLowTime, {'double'}, {'vector'}, 'DAQmxReadCtrTime', 'readArrayLowTime', 6);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadCtrTime', 'arraySizeInSamps', 7);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadCtrTime', 'sampsPerChanRead', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrTime', 'reserved', 9);
    [status, readArrayHighTime, readArrayLowTime, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadCtrTime', taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved);
end
