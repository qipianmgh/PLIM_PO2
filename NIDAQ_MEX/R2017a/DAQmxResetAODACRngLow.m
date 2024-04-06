% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRngLow(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRngLow', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRngLow', taskHandle, channel);
end
