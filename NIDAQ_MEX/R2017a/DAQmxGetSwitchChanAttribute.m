% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetSwitchChanAttribute(switchChannelName, attribute, value)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanAttribute', 'switchChannelName', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxGetSwitchChanAttribute', 'attribute', 2);
    validateattributes(value, {'uint32'}, {'vector'}, 'DAQmxGetSwitchChanAttribute', 'value', 3);
    [status, value]= mexNIDAQmx('DAQmxGetSwitchChanAttribute', switchChannelName, attribute, value);
end
