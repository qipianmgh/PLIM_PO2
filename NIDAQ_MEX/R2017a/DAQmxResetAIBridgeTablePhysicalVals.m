% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTablePhysicalVals(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTablePhysicalVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTablePhysicalVals', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTablePhysicalVals', taskHandle, channel);
end
