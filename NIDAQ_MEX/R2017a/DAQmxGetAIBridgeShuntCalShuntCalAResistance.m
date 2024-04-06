% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeShuntCalShuntCalAResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalShuntCalAResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalShuntCalAResistance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeShuntCalShuntCalAResistance', taskHandle, channel, data);
end
