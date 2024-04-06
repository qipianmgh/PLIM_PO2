% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, taskHandle] = DAQmxCreateWatchdogTimerTask(deviceName, taskName, taskHandle, timeout, lines, expState, varargs)
    % Not validating parameters due to VARARGS
    [status, taskHandle]= mexNIDAQmx('DAQmxCreateWatchdogTimerTask', deviceName, taskName, taskHandle, timeout, lines, expState, varargs);
end
