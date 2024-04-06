% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetTrigAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetTrigAttribute', taskHandle, attribute, varargs);
end
