% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCISemiPeriodDigFltrTimebaseRate', taskHandle, channel, data);
end
