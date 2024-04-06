% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedScaleAuthor(scaleName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetPersistedScaleAuthor', 'scaleName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPersistedScaleAuthor', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPersistedScaleAuthor', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedScaleAuthor', scaleName, data, bufferSize);
end
