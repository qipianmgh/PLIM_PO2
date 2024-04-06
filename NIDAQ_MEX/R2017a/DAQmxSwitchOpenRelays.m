% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchOpenRelays(relayList, waitForSettling)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(relayList, {'char'}, {'vector'}, 'DAQmxSwitchOpenRelays', 'relayList', 1);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchOpenRelays', 'waitForSettling', 2);
    [status]= mexNIDAQmx('DAQmxSwitchOpenRelays', relayList, waitForSettling);
end
