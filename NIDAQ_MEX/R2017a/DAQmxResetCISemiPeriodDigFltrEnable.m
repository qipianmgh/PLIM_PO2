% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCISemiPeriodDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCISemiPeriodDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCISemiPeriodDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCISemiPeriodDigFltrEnable', taskHandle, channel);
end
