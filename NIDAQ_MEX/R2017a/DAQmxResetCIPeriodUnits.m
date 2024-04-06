% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPeriodUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPeriodUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPeriodUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPeriodUnits', taskHandle, channel);
end
