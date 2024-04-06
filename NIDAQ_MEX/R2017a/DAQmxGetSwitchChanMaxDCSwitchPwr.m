% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxDCSwitchPwr(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCSwitchPwr', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCSwitchPwr', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxDCSwitchPwr', switchChannelName, data);
end
