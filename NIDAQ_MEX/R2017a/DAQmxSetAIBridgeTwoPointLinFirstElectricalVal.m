% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinFirstElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTwoPointLinFirstElectricalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinFirstElectricalVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeTwoPointLinFirstElectricalVal', taskHandle, channel, data);
end
