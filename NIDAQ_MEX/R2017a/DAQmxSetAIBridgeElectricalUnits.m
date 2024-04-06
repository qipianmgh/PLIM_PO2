% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIBridgeElectricalUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeElectricalUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeElectricalUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIBridgeElectricalUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIBridgeElectricalUnits', taskHandle, channel, data);
end
