% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinSecondElectricalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTwoPointLinSecondElectricalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinSecondElectricalVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeTwoPointLinSecondElectricalVal', taskHandle, channel, data);
end
