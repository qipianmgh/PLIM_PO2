% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevSettlingTime(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevSettlingTime', 'deviceName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSwitchDevSettlingTime', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevSettlingTime', deviceName, data);
end
