% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitSrc', taskHandle, channel);
end
