% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, relayPos] = DAQmxSwitchGetSingleRelayPos(relayName, relayPos)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(relayName, {'char'}, {'vector'}, 'DAQmxSwitchGetSingleRelayPos', 'relayName', 1);
    validateattributes(relayPos, {'uint32'}, {'vector'}, 'DAQmxSwitchGetSingleRelayPos', 'relayPos', 2);
    [status, relayPos]= mexNIDAQmx('DAQmxSwitchGetSingleRelayPos', relayName, relayPos);
end
