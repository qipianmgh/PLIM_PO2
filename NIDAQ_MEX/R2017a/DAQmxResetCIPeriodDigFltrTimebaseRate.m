% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPeriodDigFltrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPeriodDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPeriodDigFltrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPeriodDigFltrTimebaseRate', taskHandle, channel);
end
