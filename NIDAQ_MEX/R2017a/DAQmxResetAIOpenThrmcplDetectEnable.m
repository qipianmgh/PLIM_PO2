% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIOpenThrmcplDetectEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIOpenThrmcplDetectEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIOpenThrmcplDetectEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIOpenThrmcplDetectEnable', taskHandle, channel);
end
