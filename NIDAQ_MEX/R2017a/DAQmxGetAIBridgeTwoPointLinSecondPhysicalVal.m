% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal', taskHandle, channel, data);
end
