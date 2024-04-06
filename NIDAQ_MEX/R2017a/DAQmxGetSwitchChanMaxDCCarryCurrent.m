% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanMaxDCCarryCurrent(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCCarryCurrent', 'switchChannelName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchChanMaxDCCarryCurrent', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanMaxDCCarryCurrent', switchChannelName, data);
end
