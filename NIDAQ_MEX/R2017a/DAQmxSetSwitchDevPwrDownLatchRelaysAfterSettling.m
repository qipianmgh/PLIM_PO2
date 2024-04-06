% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling', deviceName, data);
end
