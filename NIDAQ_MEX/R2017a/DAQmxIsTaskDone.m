% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, isTaskDone] = DAQmxIsTaskDone(taskHandle, isTaskDone)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxIsTaskDone', 'taskHandle', 1);
    validateattributes(isTaskDone, {'uint32'}, {'vector'}, 'DAQmxIsTaskDone', 'isTaskDone', 2);
    [status, isTaskDone]= mexNIDAQmx('DAQmxIsTaskDone', taskHandle, isTaskDone);
end
