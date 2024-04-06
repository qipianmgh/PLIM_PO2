% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetTimingAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetTimingAttribute', taskHandle, attribute, varargs);
end
