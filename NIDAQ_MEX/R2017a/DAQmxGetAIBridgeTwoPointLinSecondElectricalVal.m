% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeTwoPointLinSecondElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinSecondElectricalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinSecondElectricalVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeTwoPointLinSecondElectricalVal', taskHandle, channel, data);
end
