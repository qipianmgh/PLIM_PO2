% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgePhysicalUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgePhysicalUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgePhysicalUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIBridgePhysicalUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgePhysicalUnits', taskHandle, channel, data);
end
