% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIDeviceTempChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIDeviceTempChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIDeviceTempChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIDeviceTempChan', 'nameToAssignToChannel', 3);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIDeviceTempChan', 'units', 4);
    [status]= mexNIDAQmx('DAQmxCreateAIDeviceTempChan', taskHandle, physicalChannel, nameToAssignToChannel, units);
end
