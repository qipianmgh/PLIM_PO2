% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalGainAdjust', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeShuntCalGainAdjust', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalGainAdjust', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeShuntCalGainAdjust', taskHandle, channel, data);
end
