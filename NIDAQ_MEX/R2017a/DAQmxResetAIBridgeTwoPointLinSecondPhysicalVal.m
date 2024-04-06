% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal', taskHandle, channel);
end
