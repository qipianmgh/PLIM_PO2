% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseHighTicks(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseHighTicks', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseHighTicks', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseHighTicks', taskHandle, channel);
end
