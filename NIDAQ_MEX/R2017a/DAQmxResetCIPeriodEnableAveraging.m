% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPeriodEnableAveraging(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPeriodEnableAveraging', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPeriodEnableAveraging', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPeriodEnableAveraging', taskHandle, channel);
end
