% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, state] = DAQmxGetDigitalPullUpPullDownStates(deviceName, channelName, state, varargs)
    % Not validating parameters due to VARARGS
    [status, state]= mexNIDAQmx('DAQmxGetDigitalPullUpPullDownStates', deviceName, channelName, state, varargs);
end
