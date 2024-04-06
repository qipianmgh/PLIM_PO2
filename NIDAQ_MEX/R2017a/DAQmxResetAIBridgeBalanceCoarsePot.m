% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeBalanceCoarsePot(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeBalanceCoarsePot', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeBalanceCoarsePot', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeBalanceCoarsePot', taskHandle, channel);
end
