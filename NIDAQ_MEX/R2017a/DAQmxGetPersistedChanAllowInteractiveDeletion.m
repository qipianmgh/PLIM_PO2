% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedChanAllowInteractiveDeletion(channel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetPersistedChanAllowInteractiveDeletion', 'channel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPersistedChanAllowInteractiveDeletion', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedChanAllowInteractiveDeletion', channel, data);
end
