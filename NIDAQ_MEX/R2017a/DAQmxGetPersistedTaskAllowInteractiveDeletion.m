% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedTaskAllowInteractiveDeletion(taskName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxGetPersistedTaskAllowInteractiveDeletion', 'taskName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedTaskAllowInteractiveDeletion', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedTaskAllowInteractiveDeletion', taskName, data);
end
