% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCISemiPeriodDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCISemiPeriodDigFltrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCISemiPeriodDigFltrTimebaseRate', taskHandle, channel);
end
