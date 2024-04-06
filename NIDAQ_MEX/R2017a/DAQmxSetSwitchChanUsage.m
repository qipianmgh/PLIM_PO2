% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchChanUsage(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxSetSwitchChanUsage', 'switchChannelName', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSwitchChanUsage', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchChanUsage', switchChannelName, data);
end
