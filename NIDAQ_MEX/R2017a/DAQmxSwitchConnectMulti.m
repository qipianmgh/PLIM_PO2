% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchConnectMulti(connectionList, waitForSettling)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(connectionList, {'char'}, {'vector'}, 'DAQmxSwitchConnectMulti', 'connectionList', 1);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchConnectMulti', 'waitForSettling', 2);
    [status]= mexNIDAQmx('DAQmxSwitchConnectMulti', connectionList, waitForSettling);
end
