% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITimestampInitialSeconds(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITimestampInitialSeconds', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITimestampInitialSeconds', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITimestampInitialSeconds', taskHandle, channel);
end
