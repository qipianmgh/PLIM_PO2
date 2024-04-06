% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalShuntCalAActualResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeShuntCalShuntCalAActualResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalShuntCalAActualResistance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeShuntCalShuntCalAActualResistance', taskHandle, channel, data);
end
