% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeShuntCalSelect(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalSelect', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeShuntCalSelect', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIBridgeShuntCalSelect', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeShuntCalSelect', taskHandle, channel, data);
end
