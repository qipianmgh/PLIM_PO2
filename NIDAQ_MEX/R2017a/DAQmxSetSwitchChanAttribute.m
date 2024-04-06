% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchChanAttribute(switchChannelName, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetSwitchChanAttribute', switchChannelName, attribute, varargs);
end
