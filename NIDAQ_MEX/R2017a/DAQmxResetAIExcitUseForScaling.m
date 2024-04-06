% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitUseForScaling(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitUseForScaling', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitUseForScaling', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitUseForScaling', taskHandle, channel);
end
