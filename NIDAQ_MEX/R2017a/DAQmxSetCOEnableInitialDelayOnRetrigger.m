% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOEnableInitialDelayOnRetrigger', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOEnableInitialDelayOnRetrigger', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOEnableInitialDelayOnRetrigger', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOEnableInitialDelayOnRetrigger', taskHandle, channel, data);
end