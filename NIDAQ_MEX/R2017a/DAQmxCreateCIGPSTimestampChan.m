% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIGPSTimestampChan(taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIGPSTimestampChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIGPSTimestampChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIGPSTimestampChan', 'nameToAssignToChannel', 3);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIGPSTimestampChan', 'units', 4);
    validateattributes(syncMethod, {'int32'}, {'scalar'}, 'DAQmxCreateCIGPSTimestampChan', 'syncMethod', 5);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCIGPSTimestampChan', 'customScaleName', 6);
    [status]= mexNIDAQmx('DAQmxCreateCIGPSTimestampChan', taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName);
end
