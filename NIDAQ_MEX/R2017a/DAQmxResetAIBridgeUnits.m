% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeUnits', taskHandle, channel);
end
