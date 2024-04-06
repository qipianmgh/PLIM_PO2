% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeBalanceCoarsePot', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeBalanceCoarsePot', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIBridgeBalanceCoarsePot', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeBalanceCoarsePot', taskHandle, channel, data);
end
