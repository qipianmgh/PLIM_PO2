% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCOPulseChanTime(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanTime', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanTime', 'nameToAssignToChannel', 3);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'units', 4);
    validateattributes(idleState, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'idleState', 5);
    validateattributes(initialDelay, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'initialDelay', 6);
    validateattributes(lowTime, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'lowTime', 7);
    validateattributes(highTime, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanTime', 'highTime', 8);
    [status]= mexNIDAQmx('DAQmxCreateCOPulseChanTime', taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime);
end
