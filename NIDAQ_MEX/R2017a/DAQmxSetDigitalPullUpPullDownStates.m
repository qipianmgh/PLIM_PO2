% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigitalPullUpPullDownStates(deviceName, channelName, state, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetDigitalPullUpPullDownStates', deviceName, channelName, state, varargs);
end
