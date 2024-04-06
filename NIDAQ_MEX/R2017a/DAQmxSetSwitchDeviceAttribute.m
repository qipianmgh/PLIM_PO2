% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchDeviceAttribute(deviceName, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetSwitchDeviceAttribute', deviceName, attribute, varargs);
end
