% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateDIChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateDIChan', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxCreateDIChan', 'lines', 2);
    validateattributes(nameToAssignToLines, {'char'}, {'vector'}, 'DAQmxCreateDIChan', 'nameToAssignToLines', 3);
    validateattributes(lineGrouping, {'int32'}, {'scalar'}, 'DAQmxCreateDIChan', 'lineGrouping', 4);
    [status]= mexNIDAQmx('DAQmxCreateDIChan', taskHandle, lines, nameToAssignToLines, lineGrouping);
end
