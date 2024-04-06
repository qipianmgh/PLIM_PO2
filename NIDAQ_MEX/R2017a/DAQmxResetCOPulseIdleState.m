% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseIdleState(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseIdleState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseIdleState', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseIdleState', taskHandle, channel);
end
