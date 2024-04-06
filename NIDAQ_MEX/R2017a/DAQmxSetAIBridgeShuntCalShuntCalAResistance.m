% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalShuntCalAResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeShuntCalShuntCalAResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalShuntCalAResistance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeShuntCalShuntCalAResistance', taskHandle, channel, data);
end
