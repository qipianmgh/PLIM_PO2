% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCOPulseChanFreq(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanFreq', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanFreq', 'nameToAssignToChannel', 3);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'units', 4);
    validateattributes(idleState, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'idleState', 5);
    validateattributes(initialDelay, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'initialDelay', 6);
    validateattributes(freq, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'freq', 7);
    validateattributes(dutyCycle, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'dutyCycle', 8);
    [status]= mexNIDAQmx('DAQmxCreateCOPulseChanFreq', taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle);
end
