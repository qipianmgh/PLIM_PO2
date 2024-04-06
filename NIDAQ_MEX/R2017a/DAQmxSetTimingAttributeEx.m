% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetTimingAttributeEx(taskHandle, deviceNames, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetTimingAttributeEx', taskHandle, deviceNames, attribute, varargs);
end
