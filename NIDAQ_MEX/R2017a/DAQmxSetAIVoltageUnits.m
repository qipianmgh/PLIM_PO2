% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIVoltageUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIVoltageUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIVoltageUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIVoltageUnits', taskHandle, channel, data);
end
