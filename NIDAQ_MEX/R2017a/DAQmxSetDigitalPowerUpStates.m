% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigitalPowerUpStates(deviceName, channelNames, state, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetDigitalPowerUpStates', deviceName, channelNames, state, varargs);
end
