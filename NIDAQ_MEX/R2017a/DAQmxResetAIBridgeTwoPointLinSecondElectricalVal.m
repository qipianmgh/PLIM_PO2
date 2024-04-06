% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTwoPointLinSecondElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTwoPointLinSecondElectricalVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTwoPointLinSecondElectricalVal', taskHandle, channel);
end
