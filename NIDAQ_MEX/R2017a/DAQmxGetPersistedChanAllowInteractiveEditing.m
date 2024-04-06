% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedChanAllowInteractiveEditing(channel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetPersistedChanAllowInteractiveEditing', 'channel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedChanAllowInteractiveEditing', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedChanAllowInteractiveEditing', channel, data);
end
