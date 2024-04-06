% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxDeleteSavedTask(taskName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxDeleteSavedTask', 'taskName', 1);
    [status]= mexNIDAQmx('DAQmxDeleteSavedTask', taskName);
end
