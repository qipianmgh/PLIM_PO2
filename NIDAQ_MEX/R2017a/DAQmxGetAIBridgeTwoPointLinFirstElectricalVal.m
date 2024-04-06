% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeTwoPointLinFirstElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinFirstElectricalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinFirstElectricalVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeTwoPointLinFirstElectricalVal', taskHandle, channel, data);
end
