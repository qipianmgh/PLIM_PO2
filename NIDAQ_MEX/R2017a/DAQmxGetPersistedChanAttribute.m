% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetPersistedChanAttribute(channel, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetPersistedChanAttribute', channel, attribute, value, varargs);
end
