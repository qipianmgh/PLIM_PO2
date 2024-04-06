% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetWriteAttribute', taskHandle, attribute, varargs);
end
