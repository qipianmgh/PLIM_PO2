% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal', taskHandle, channel, data);
end
