% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAISoundPressureUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAISoundPressureUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAISoundPressureUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAISoundPressureUnits', taskHandle, channel);
end
