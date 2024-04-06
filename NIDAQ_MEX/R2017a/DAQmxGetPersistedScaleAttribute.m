% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetPersistedScaleAttribute(scaleName, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetPersistedScaleAttribute', scaleName, attribute, value, varargs);
end
