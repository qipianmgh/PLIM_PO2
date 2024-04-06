% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetBufferAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetBufferAttribute', taskHandle, attribute, varargs);
end
