% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedTaskAuthor(taskName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxGetPersistedTaskAuthor', 'taskName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPersistedTaskAuthor', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPersistedTaskAuthor', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedTaskAuthor', taskName, data, bufferSize);
end
