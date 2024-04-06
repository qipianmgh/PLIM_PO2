% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxACSwitchCurrent(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxACSwitchCurrent', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxACSwitchCurrent', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxACSwitchCurrent', switchChannelName, data);
end
