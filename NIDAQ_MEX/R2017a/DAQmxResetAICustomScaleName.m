% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAICustomScaleName(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAICustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAICustomScaleName', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAICustomScaleName', taskHandle, channel);
end
