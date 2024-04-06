% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, taskHandle] = DAQmxCreateTask(taskName, taskHandle)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxCreateTask', 'taskName', 1);
    validateattributes(taskHandle, {'uint64'}, {'vector'}, 'DAQmxCreateTask', 'taskHandle', 2);
    [status, taskHandle]= mexNIDAQmx('DAQmxCreateTask', taskName, taskHandle);
end
