% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCICountEdgesChan(taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCICountEdgesChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCICountEdgesChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCICountEdgesChan', 'nameToAssignToChannel', 3);
    validateattributes(edge, {'int32'}, {'scalar'}, 'DAQmxCreateCICountEdgesChan', 'edge', 4);
    validateattributes(initialCount, {'uint32'}, {'scalar'}, 'DAQmxCreateCICountEdgesChan', 'initialCount', 5);
    validateattributes(countDirection, {'int32'}, {'scalar'}, 'DAQmxCreateCICountEdgesChan', 'countDirection', 6);
    [status]= mexNIDAQmx('DAQmxCreateCICountEdgesChan', taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection);
end
