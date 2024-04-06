% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetDeviceAttribute(deviceName, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetDeviceAttribute', deviceName, attribute, value, varargs);
end
