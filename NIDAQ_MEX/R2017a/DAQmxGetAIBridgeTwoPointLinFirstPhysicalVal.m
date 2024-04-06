% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal', taskHandle, channel, data);
end
