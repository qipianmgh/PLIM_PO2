% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxDCCarryPwr(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCCarryPwr', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCCarryPwr', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxDCCarryPwr', switchChannelName, data);
end
