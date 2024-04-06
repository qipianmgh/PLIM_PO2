% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedScaleAllowInteractiveDeletion(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetPersistedScaleAllowInteractiveDeletion', 'scaleName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedScaleAllowInteractiveDeletion', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedScaleAllowInteractiveDeletion', scaleName, data);
end
