% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateDOChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateDOChan', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxCreateDOChan', 'lines', 2);
    validateattributes(nameToAssignToLines, {'char'}, {'vector'}, 'DAQmxCreateDOChan', 'nameToAssignToLines', 3);
    validateattributes(lineGrouping, {'int32'}, {'scalar'}, 'DAQmxCreateDOChan', 'lineGrouping', 4);
    [status]= mexNIDAQmx('DAQmxCreateDOChan', taskHandle, lines, nameToAssignToLines, lineGrouping);
end
