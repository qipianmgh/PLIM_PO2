% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchCloseRelays(relayList, waitForSettling)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(relayList, {'char'}, {'vector'}, 'DAQmxSwitchCloseRelays', 'relayList', 1);
    validateattributes(waitForSettling, {'uint32'}, {'scalar'}, 'DAQmxSwitchCloseRelays', 'waitForSettling', 2);
    [status]= mexNIDAQmx('DAQmxSwitchCloseRelays', relayList, waitForSettling);
end
