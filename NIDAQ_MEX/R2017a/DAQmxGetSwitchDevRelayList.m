% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevRelayList(deviceName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevRelayList', 'deviceName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSwitchDevRelayList', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSwitchDevRelayList', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevRelayList', deviceName, data, bufferSize);
end
