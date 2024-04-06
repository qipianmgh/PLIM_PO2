% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevNumRelays(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevNumRelays', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevNumRelays', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevNumRelays', deviceName, data);
end
