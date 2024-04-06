% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxACCarryCurrent(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxACCarryCurrent', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxACCarryCurrent', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxACCarryCurrent', switchChannelName, data);
end
