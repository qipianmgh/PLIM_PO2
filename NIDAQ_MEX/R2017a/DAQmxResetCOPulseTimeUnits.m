% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseTimeUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseTimeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseTimeUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseTimeUnits', taskHandle, channel);
end
