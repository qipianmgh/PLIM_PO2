% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRngHigh(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRngHigh', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRngHigh', taskHandle, channel);
end
