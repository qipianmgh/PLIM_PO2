% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchConnect(switchChannel1, switchChannel2, waitForSettling)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(switchChannel1, {'char'}, {'vector'}, 'DAQmxSwitchConnect', 'switchChannel1', 1);
    validateattributes(switchChannel2, {'char'}, {'vector'}, 'DAQmxSwitchConnect', 'switchChannel2', 2);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchConnect', 'waitForSettling', 3);
    [status]= mexNIDAQmx('DAQmxSwitchConnect', switchChannel1, switchChannel2, waitForSettling);
end
