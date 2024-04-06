% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxDeleteSavedGlobalChan(channelName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxDeleteSavedGlobalChan', 'channelName', 1);
    [status]= mexNIDAQmx('DAQmxDeleteSavedGlobalChan', channelName);
end
