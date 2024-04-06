% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOEnableInitialDelayOnRetrigger', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOEnableInitialDelayOnRetrigger', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOEnableInitialDelayOnRetrigger', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOEnableInitialDelayOnRetrigger', taskHandle, channel, data);
end
