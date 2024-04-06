% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIVoltageUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIVoltageUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIVoltageUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIVoltageUnits', taskHandle, channel, data);
end
