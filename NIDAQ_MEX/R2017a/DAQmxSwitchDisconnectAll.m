% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchDisconnectAll(deviceName, waitForSettling)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSwitchDisconnectAll', 'deviceName', 1);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchDisconnectAll', 'waitForSettling', 2);
    [status]= mexNIDAQmx('DAQmxSwitchDisconnectAll', deviceName, waitForSettling);
end
