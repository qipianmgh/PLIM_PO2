% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCOPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCOPulseChanTicks', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanTicks', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanTicks', 'nameToAssignToChannel', 3);
    validateattributes(sourceTerminal, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanTicks', 'sourceTerminal', 4);
    validateattributes(idleState, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTicks', 'idleState', 5);
    validateattributes(initialDelay, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTicks', 'initialDelay', 6);
    validateattributes(lowTicks, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTicks', 'lowTicks', 7);
    validateattributes(highTicks, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTicks', 'highTicks', 8);
    [status]= mexNIDAQmx('DAQmxCreateCOPulseChanTicks', taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks);
end
