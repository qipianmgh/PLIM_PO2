% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxPerformStrainShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxPerformStrainShuntCal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxPerformStrainShuntCal', 'channel', 2);
    validateattributes(shuntResistorValue, {'double'}, {'scalar'}, 'DAQmxPerformStrainShuntCal', 'shuntResistorValue', 3);
    validateattributes(shuntResistorLocation, {'int32'}, {'scalar'}, 'DAQmxPerformStrainShuntCal', 'shuntResistorLocation', 4);
    validateattributes(skipUnsupportedChannels, {'uint32'}, {'scalar'}, 'DAQmxPerformStrainShuntCal', 'skipUnsupportedChannels', 5);
    [status]= mexNIDAQmx('DAQmxPerformStrainShuntCal', taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels);
end
