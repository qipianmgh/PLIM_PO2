% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAITempBuiltInSensorChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAITempBuiltInSensorChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAITempBuiltInSensorChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAITempBuiltInSensorChan', 'nameToAssignToChannel', 3);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAITempBuiltInSensorChan', 'units', 4);
    [status]= mexNIDAQmx('DAQmxCreateAITempBuiltInSensorChan', taskHandle, physicalChannel, nameToAssignToChannel, units);
end
