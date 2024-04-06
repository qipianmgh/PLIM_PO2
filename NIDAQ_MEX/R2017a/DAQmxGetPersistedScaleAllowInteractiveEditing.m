% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedScaleAllowInteractiveEditing(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetPersistedScaleAllowInteractiveEditing', 'scaleName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedScaleAllowInteractiveEditing', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedScaleAllowInteractiveEditing', scaleName, data);
end
