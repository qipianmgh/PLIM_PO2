% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOVoltageUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOVoltageUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOVoltageUnits', taskHandle, channel);
end
