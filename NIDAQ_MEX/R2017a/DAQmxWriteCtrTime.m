% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, numSampsPerChanWritten, reserved] = DAQmxWriteCtrTime(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
    narginchk(9, 9);
    nargoutchk(3, 3);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteCtrTime', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteCtrTime', 'numSampsPerChan', 2);
    validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTime', 'autoStart', 3);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteCtrTime', 'timeout', 4);
    validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteCtrTime', 'dataLayout', 5);
    validateattributes(highTime, {'double'}, {'vector'}, 'DAQmxWriteCtrTime', 'highTime', 6);
    validateattributes(lowTime, {'double'}, {'vector'}, 'DAQmxWriteCtrTime', 'lowTime', 7);
    validateattributes(numSampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteCtrTime', 'numSampsPerChanWritten', 8);
    validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteCtrTime', 'reserved', 9);
    [status, numSampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteCtrTime', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved);
end
