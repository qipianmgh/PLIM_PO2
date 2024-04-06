% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAISampAndHoldEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAISampAndHoldEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAISampAndHoldEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAISampAndHoldEnable', taskHandle, channel);
end
