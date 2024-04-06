% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetCalInfoAttribute(deviceName, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetCalInfoAttribute', deviceName, attribute, value, varargs);
end
