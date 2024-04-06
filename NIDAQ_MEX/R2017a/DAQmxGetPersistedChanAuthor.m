% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPersistedChanAuthor(channel, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetPersistedChanAuthor', 'channel', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPersistedChanAuthor', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPersistedChanAuthor', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPersistedChanAuthor', channel, data, bufferSize);
end
