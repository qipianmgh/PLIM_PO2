% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxACVoltage(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxACVoltage', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxACVoltage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxACVoltage', switchChannelName, data);
end
