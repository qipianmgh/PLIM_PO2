% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseHighTime(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseHighTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseHighTime', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseHighTime', taskHandle, channel);
end
