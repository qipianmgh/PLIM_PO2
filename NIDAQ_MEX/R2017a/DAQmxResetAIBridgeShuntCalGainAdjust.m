% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeShuntCalGainAdjust(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeShuntCalGainAdjust', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeShuntCalGainAdjust', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeShuntCalGainAdjust', taskHandle, channel);
end
