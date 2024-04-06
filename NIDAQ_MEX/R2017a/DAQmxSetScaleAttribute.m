% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleAttribute(scaleName, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetScaleAttribute', scaleName, attribute, varargs);
end
