% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPeriodDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPeriodDigFltrTimebaseRate', taskHandle, channel, data);
end
