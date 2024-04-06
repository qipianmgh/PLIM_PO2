% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedTaskAllowInteractiveEditing(taskName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxGetPersistedTaskAllowInteractiveEditing', 'taskName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedTaskAllowInteractiveEditing', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedTaskAllowInteractiveEditing', taskName, data);
end
