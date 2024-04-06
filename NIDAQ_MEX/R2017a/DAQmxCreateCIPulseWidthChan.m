% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIPulseWidthChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIPulseWidthChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIPulseWidthChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIPulseWidthChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseWidthChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseWidthChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIPulseWidthChan', 'units', 6);
    validateattributes(startingEdge, {'int32'}, {'scalar'}, 'DAQmxCreateCIPulseWidthChan', 'startingEdge', 7);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCIPulseWidthChan', 'customScaleName', 8);
    [status]= mexNIDAQmx('DAQmxCreateCIPulseWidthChan', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName);
end
