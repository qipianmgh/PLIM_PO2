% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxACSwitchPwr(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxACSwitchPwr', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxACSwitchPwr', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxACSwitchPwr', switchChannelName, data);
end
