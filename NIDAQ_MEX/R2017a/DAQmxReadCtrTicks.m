% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArrayHighTicks, readArrayLowTicks, sampsPerChanRead, reserved] = DAQmxReadCtrTicks(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(9, 9);
    nargoutchk(5, 5);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrTicks', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadCtrTicks', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrTicks', 'timeout', 3);
    validateattributes(interleaved, {'uint32'}, {'scalar'}, 'DAQmxReadCtrTicks', 'interleaved', 4);
    validateattributes(readArrayHighTicks, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicks', 'readArrayHighTicks', 5);
    validateattributes(readArrayLowTicks, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicks', 'readArrayLowTicks', 6);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadCtrTicks', 'arraySizeInSamps', 7);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadCtrTicks', 'sampsPerChanRead', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrTicks', 'reserved', 9);
    [status, readArrayHighTicks, readArrayLowTicks, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadCtrTicks', taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved);
end
