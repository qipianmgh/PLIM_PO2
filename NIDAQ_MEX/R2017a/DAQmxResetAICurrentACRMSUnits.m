% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAICurrentACRMSUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAICurrentACRMSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAICurrentACRMSUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAICurrentACRMSUnits', taskHandle, channel);
end
