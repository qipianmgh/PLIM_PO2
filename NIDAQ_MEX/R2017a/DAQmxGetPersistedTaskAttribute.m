% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetPersistedTaskAttribute(taskName, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetPersistedTaskAttribute', taskName, attribute, value, varargs);
end
