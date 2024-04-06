% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCITwoEdgeSepChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCITwoEdgeSepChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCITwoEdgeSepChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'units', 6);
    validateattributes(firstEdge, {'int32'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'firstEdge', 7);
    validateattributes(secondEdge, {'int32'}, {'scalar'}, 'DAQmxCreateCITwoEdgeSepChan', 'secondEdge', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCITwoEdgeSepChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateCITwoEdgeSepChan', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName);
end
