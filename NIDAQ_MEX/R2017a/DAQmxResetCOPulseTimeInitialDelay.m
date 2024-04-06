% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseTimeInitialDelay(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseTimeInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseTimeInitialDelay', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseTimeInitialDelay', taskHandle, channel);
end
