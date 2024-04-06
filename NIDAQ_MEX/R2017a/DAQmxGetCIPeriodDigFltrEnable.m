% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPeriodDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPeriodDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPeriodDigFltrEnable', taskHandle, channel, data);
end
