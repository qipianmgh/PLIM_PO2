% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, numSampsPerChanWritten, reserved] = DAQmxWriteCtrTicks(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
    narginchk(9, 9);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrTicks', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteCtrTicks', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTicks', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrTicks', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTicks', 'dataLayout', 5);
    validateattributes(highTicks, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTicks', 'highTicks', 6);
    validateattributes(lowTicks, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTicks', 'lowTicks', 7);
    validateattributes(numSampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteCtrTicks', 'numSampsPerChanWritten', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTicks', 'reserved', 9);
    [status, numSampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteCtrTicks', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved);
end
