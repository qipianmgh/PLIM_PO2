% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanUsage(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanUsage', 'switchChannelName', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSwitchChanUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanUsage', switchChannelName, data);
end
