% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgePhysicalUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgePhysicalUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgePhysicalUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgePhysicalUnits', taskHandle, channel);
end
