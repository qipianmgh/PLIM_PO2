% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseTicksInitialDelay(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseTicksInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseTicksInitialDelay', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseTicksInitialDelay', taskHandle, channel);
end
