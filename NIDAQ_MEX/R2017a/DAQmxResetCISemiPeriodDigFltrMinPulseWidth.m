% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCISemiPeriodDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCISemiPeriodDigFltrMinPulseWidth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCISemiPeriodDigFltrMinPulseWidth', taskHandle, channel);
end
