% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchScanAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetSwitchScanAttribute', taskHandle, attribute, varargs);
end
