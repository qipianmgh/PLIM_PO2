% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCISemiPeriodDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCISemiPeriodDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCISemiPeriodDigFltrMinPulseWidth', taskHandle, channel, data);
end
