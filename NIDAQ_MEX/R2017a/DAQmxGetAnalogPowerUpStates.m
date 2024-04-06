% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, state] = DAQmxGetAnalogPowerUpStates(deviceName, channelName, state, channelType, varargs)
    % Not validating parameters due to VARARGS
    [status, state]= mexNIDAQmx('DAQmxGetAnalogPowerUpStates', deviceName, channelName, state, channelType, varargs);
end
