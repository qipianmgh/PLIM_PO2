% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, relayPos, numRelayPossRead] = DAQmxSwitchGetMultiRelayPos(relayList, relayPos, relayPosArraySize, numRelayPossRead)
    narginchk(4, 4);
    nargoutchk(3, 3);
    validateattributes(relayList, {'char'}, {'vector'}, 'DAQmxSwitchGetMultiRelayPos', 'relayList', 1);
    validateattributes(relayPos, {'uint32'}, {'vector'}, 'DAQmxSwitchGetMultiRelayPos', 'relayPos', 2);
    validateattributes(relayPosArraySize, {'uint32'}, {'scalar'}, 'DAQmxSwitchGetMultiRelayPos', 'relayPosArraySize', 3);
    validateattributes(numRelayPossRead, {'uint32'}, {'vector'}, 'DAQmxSwitchGetMultiRelayPos', 'numRelayPossRead', 4);
    [status, relayPos, numRelayPossRead]= mexNIDAQmx('DAQmxSwitchGetMultiRelayPos', relayList, relayPos, relayPosArraySize, numRelayPossRead);
end
