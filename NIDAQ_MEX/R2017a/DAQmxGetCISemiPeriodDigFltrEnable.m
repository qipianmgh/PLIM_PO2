% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCISemiPeriodDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCISemiPeriodDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCISemiPeriodDigFltrEnable', taskHandle, channel, data);
end
