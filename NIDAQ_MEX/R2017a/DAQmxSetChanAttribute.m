% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetChanAttribute(taskHandle, channel, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetChanAttribute', taskHandle, channel, attribute, varargs);
end
