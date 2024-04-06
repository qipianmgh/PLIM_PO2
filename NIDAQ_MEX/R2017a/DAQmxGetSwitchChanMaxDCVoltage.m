% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxDCVoltage(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCVoltage', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCVoltage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxDCVoltage', switchChannelName, data);
end
