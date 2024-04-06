% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAICurrentUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAICurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAICurrentUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAICurrentUnits', taskHandle, channel);
end
