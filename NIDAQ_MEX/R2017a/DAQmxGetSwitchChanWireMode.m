% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchChanWireMode(switchChannelName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(switchChannelName, {'char'}, {'vector'}, 'DAQmxGetSwitchChanWireMode', 'switchChannelName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchChanWireMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchChanWireMode', switchChannelName, data);
end
