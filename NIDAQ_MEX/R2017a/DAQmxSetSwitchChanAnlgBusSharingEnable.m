% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxSetSwitchChanAnlgBusSharingEnable', 'switchChannelName', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSwitchChanAnlgBusSharingEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchChanAnlgBusSharingEnable', switchChannelName, data);
end
