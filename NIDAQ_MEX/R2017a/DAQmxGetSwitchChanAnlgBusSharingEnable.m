% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanAnlgBusSharingEnable', 'switchChannelName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchChanAnlgBusSharingEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanAnlgBusSharingEnable', switchChannelName, data);
end
