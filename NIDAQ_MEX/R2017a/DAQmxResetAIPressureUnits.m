% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIPressureUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIPressureUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIPressureUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIPressureUnits', taskHandle, channel);
end
