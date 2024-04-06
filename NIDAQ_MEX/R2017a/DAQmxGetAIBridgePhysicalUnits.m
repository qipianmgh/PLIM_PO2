% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgePhysicalUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgePhysicalUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgePhysicalUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIBridgePhysicalUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgePhysicalUnits', taskHandle, channel, data);
end
