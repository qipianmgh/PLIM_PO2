% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIBridgeCfg', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeCfg', taskHandle, channel, data);
end
