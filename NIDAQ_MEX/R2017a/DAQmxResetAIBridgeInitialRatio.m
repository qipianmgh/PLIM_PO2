% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeInitialRatio(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeInitialRatio', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeInitialRatio', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeInitialRatio', taskHandle, channel);
end
