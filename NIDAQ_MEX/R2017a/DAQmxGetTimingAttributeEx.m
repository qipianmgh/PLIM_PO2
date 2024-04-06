% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetTimingAttributeEx(taskHandle, deviceNames, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetTimingAttributeEx', taskHandle, deviceNames, attribute, value, varargs);
end
