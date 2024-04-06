% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, readArrayFrequency, readArrayDutyCycle, sampsPerChanRead, reserved] = DAQmxReadCtrFreq(taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
    narginchk(9, 9);
    nargoutchk(5, 5);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadCtrFreq', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadCtrFreq', 'numSampsPerChan', 2);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadCtrFreq', 'timeout', 3);
    validateattributes(interleaved, {'uint32'}, {'scalar'}, 'DAQmxReadCtrFreq', 'interleaved', 4);
    validateattributes(readArrayFrequency, {'double'}, {'vector'}, 'DAQmxReadCtrFreq', 'readArrayFrequency', 5);
    validateattributes(readArrayDutyCycle, {'double'}, {'vector'}, 'DAQmxReadCtrFreq', 'readArrayDutyCycle', 6);
    validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadCtrFreq', 'arraySizeInSamps', 7);
    validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadCtrFreq', 'sampsPerChanRead', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadCtrFreq', 'reserved', 9);
    [status, readArrayFrequency, readArrayDutyCycle, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadCtrFreq', taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved);
end
