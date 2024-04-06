% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling', deviceName, data);
end
