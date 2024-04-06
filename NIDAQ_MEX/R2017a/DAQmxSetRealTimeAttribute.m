% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRealTimeAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetRealTimeAttribute', taskHandle, attribute, varargs);
end
