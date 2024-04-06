% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal', taskHandle, channel, data);
end
