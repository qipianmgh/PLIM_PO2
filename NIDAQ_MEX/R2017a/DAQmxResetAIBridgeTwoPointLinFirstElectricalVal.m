% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTwoPointLinFirstElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTwoPointLinFirstElectricalVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTwoPointLinFirstElectricalVal', taskHandle, channel);
end
