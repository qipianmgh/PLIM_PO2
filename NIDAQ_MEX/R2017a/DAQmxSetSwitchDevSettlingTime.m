% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchDevSettlingTime(deviceName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSetSwitchDevSettlingTime', 'deviceName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSwitchDevSettlingTime', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchDevSettlingTime', deviceName, data);
end
