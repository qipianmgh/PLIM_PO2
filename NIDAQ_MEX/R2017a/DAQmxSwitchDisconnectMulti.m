% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchDisconnectMulti(connectionList, waitForSettling)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(connectionList, {'char'}, {'vector'}, 'DAQmxSwitchDisconnectMulti', 'connectionList', 1);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchDisconnectMulti', 'waitForSettling', 2);
    [status]= mexNIDAQmx('DAQmxSwitchDisconnectMulti', connectionList, waitForSettling);
end
