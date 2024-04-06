% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeInitialRatio(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeInitialRatio', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeInitialRatio', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeInitialRatio', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeInitialRatio', taskHandle, channel, data);
end
