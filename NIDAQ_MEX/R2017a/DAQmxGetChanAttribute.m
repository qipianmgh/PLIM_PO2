% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetChanAttribute(taskHandle, channel, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetChanAttribute', taskHandle, channel, attribute, value, varargs);
end
