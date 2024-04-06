% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, taskHandle] = DAQmxLoadTask(taskName, taskHandle)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxLoadTask', 'taskName', 1);
    validateattributes(taskHandle, {'uint64'}, {'vector'}, 'DAQmxLoadTask', 'taskHandle', 2);
    [status, taskHandle]= mexNIDAQmx('DAQmxLoadTask', taskName, taskHandle);
end
