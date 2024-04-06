% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeBalanceCoarsePot', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeBalanceCoarsePot', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIBridgeBalanceCoarsePot', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeBalanceCoarsePot', taskHandle, channel, data);
end
