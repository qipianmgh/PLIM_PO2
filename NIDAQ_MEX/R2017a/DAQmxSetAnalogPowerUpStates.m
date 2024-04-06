% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnalogPowerUpStates(deviceName, channelNames, state, channelType, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetAnalogPowerUpStates', deviceName, channelNames, state, channelType, varargs);
end
