% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal', taskHandle, channel);
end
