% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeShuntCalSelect(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeShuntCalSelect', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalSelect', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIBridgeShuntCalSelect', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeShuntCalSelect', taskHandle, channel, data);
end
