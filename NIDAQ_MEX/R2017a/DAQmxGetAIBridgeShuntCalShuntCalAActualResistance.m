% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeShuntCalShuntCalAActualResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalShuntCalAActualResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalShuntCalAActualResistance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeShuntCalShuntCalAActualResistance', taskHandle, channel, data);
end
