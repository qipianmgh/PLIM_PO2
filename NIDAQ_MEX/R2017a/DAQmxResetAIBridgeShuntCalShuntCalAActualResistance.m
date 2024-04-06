% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeShuntCalShuntCalAActualResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeShuntCalShuntCalAActualResistance', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeShuntCalShuntCalAActualResistance', taskHandle, channel);
end
