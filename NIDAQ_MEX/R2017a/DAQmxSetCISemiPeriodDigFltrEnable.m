% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCISemiPeriodDigFltrEnable', taskHandle, channel, data);
end
