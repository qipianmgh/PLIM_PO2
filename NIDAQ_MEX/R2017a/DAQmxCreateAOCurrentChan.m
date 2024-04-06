% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAOCurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAOCurrentChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAOCurrentChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAOCurrentChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAOCurrentChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAOCurrentChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAOCurrentChan', 'units', 6);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAOCurrentChan', 'customScaleName', 7);
    [status]= mexNIDAQmx('DAQmxCreateAOCurrentChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName);
end
