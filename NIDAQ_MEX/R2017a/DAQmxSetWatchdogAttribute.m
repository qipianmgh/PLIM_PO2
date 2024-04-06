% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWatchdogAttribute(taskHandle, lines, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetWatchdogAttribute', taskHandle, lines, attribute, varargs);
end
