% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeShuntCalSelect(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeShuntCalSelect', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeShuntCalSelect', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeShuntCalSelect', taskHandle, channel);
end
