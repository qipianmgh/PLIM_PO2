% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxDCSwitchCurrent(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCSwitchCurrent', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCSwitchCurrent', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxDCSwitchCurrent', switchChannelName, data);
end
