% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchDisconnect(switchChannel1, switchChannel2, waitForSettling)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(switchChannel1, {'char'}, {'vector'}, 'DAQmxSwitchDisconnect', 'switchChannel1', 1);
    validateattributes(switchChannel2, {'char'}, {'vector'}, 'DAQmxSwitchDisconnect', 'switchChannel2', 2);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchDisconnect', 'waitForSettling', 3);
    [status]= mexNIDAQmx('DAQmxSwitchDisconnect', switchChannel1, switchChannel2, waitForSettling);
end
