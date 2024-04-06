% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxPerformBridgeShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxPerformBridgeShuntCal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxPerformBridgeShuntCal', 'channel', 2);
    validateattributes(shuntResistorValue, {'double'}, {'scalar'}, 'DAQmxPerformBridgeShuntCal', 'shuntResistorValue', 3);
    validateattributes(shuntResistorLocation, {'int32'}, {'scalar'}, 'DAQmxPerformBridgeShuntCal', 'shuntResistorLocation', 4);
    validateattributes(bridgeResistance, {'double'}, {'scalar'}, 'DAQmxPerformBridgeShuntCal', 'bridgeResistance', 5);
    validateattributes(skipUnsupportedChannels, {'uint32'}, {'scalar'}, 'DAQmxPerformBridgeShuntCal', 'skipUnsupportedChannels', 6);
    [status]= mexNIDAQmx('DAQmxPerformBridgeShuntCal', taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels);
end
