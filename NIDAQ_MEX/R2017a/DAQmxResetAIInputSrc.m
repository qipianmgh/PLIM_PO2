% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIInputSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIInputSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIInputSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIInputSrc', taskHandle, channel);
end
