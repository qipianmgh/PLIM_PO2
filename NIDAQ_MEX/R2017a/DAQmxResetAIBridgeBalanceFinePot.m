% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeBalanceFinePot(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeBalanceFinePot', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeBalanceFinePot', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeBalanceFinePot', taskHandle, channel);
end
