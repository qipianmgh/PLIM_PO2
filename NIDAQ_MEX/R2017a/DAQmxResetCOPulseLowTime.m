% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseLowTime(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseLowTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseLowTime', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseLowTime', taskHandle, channel);
end
