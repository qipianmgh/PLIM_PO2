% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeBalanceFinePot(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeBalanceFinePot', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeBalanceFinePot', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIBridgeBalanceFinePot', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeBalanceFinePot', taskHandle, channel, data);
end
