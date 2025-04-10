% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOEnableInitialDelayOnRetrigger(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOEnableInitialDelayOnRetrigger', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOEnableInitialDelayOnRetrigger', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOEnableInitialDelayOnRetrigger', taskHandle, channel);
end
