% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, numSampsPerChanWritten, reserved] = DAQmxWriteCtrFreq(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
    narginchk(9, 9);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrFreq', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteCtrFreq', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrFreq', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrFreq', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrFreq', 'dataLayout', 5);
    validateattributes(frequency, {'double'}, {'vector'}, 'DAQmxWriteCtrFreq', 'frequency', 6);
    validateattributes(dutyCycle, {'double'}, {'vector'}, 'DAQmxWriteCtrFreq', 'dutyCycle', 7);
    validateattributes(numSampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteCtrFreq', 'numSampsPerChanWritten', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrFreq', 'reserved', 9);
    [status, numSampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteCtrFreq', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved);
end
