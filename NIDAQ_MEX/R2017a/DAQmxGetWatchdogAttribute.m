% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetWatchdogAttribute(taskHandle, lines, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetWatchdogAttribute', taskHandle, lines, attribute, value, varargs);
end
