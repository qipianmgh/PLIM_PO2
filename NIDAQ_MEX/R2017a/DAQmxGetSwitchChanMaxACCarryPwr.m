% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxACCarryPwr(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxACCarryPwr', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxACCarryPwr', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxACCarryPwr', switchChannelName, data);
end
