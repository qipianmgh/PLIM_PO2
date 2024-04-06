% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPeriodDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPeriodDigFltrMinPulseWidth', taskHandle, channel, data);
end
