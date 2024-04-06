% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIVoltageUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIVoltageUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIVoltageUnits', taskHandle, channel);
end
