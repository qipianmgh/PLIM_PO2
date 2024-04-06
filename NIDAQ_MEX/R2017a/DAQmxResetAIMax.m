% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIMax(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIMax', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIMax', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIMax', taskHandle, channel);
end
