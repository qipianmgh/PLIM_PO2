% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, count, numRelayCountsRead] = DAQmxSwitchGetMultiRelayCount(relayList, count, countArraySize, numRelayCountsRead)
    narginchk(4, 4);
    nargoutchk(3, 3);
    validateattributes(relayList, {'char'}, {'vector'}, 'DAQmxSwitchGetMultiRelayCount', 'relayList', 1);
    validateattributes(count, {'uint32'}, {'vector'}, 'DAQmxSwitchGetMultiRelayCount', 'count', 2);
    validateattributes(countArraySize, {'uint32'}, {'scalar'}, 'DAQmxSwitchGetMultiRelayCount', 'countArraySize', 3);
    validateattributes(numRelayCountsRead, {'uint32'}, {'vector'}, 'DAQmxSwitchGetMultiRelayCount', 'numRelayCountsRead', 4);
    [status, count, numRelayCountsRead]= mexNIDAQmx('DAQmxSwitchGetMultiRelayCount', relayList, count, countArraySize, numRelayCountsRead);
end
