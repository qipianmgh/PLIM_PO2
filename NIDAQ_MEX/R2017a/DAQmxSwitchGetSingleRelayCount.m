% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, count] = DAQmxSwitchGetSingleRelayCount(relayName, count)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(relayName, {'char'}, {'vector'}, 'DAQmxSwitchGetSingleRelayCount', 'relayName', 1);
    validateattributes(count, {'uint32'}, {'vector'}, 'DAQmxSwitchGetSingleRelayCount', 'count', 2);
    [status, count]= mexNIDAQmx('DAQmxSwitchGetSingleRelayCount', relayName, count);
end
