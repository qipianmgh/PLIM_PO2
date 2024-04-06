% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeInitialVoltage(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeInitialVoltage', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeInitialVoltage', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeInitialVoltage', taskHandle, channel);
end
