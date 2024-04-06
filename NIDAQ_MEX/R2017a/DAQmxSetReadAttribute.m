% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetReadAttribute', taskHandle, attribute, varargs);
end
