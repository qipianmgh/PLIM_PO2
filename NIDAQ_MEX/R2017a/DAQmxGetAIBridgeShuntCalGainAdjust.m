% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeShuntCalGainAdjust', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalGainAdjust', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalGainAdjust', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeShuntCalGainAdjust', taskHandle, channel, data);
end
