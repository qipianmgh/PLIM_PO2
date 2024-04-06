% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPeriodDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPeriodDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPeriodDigFltrEnable', taskHandle, channel, data);
end
