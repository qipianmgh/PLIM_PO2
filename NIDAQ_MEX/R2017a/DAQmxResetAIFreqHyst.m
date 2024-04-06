% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIFreqHyst(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIFreqHyst', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIFreqHyst', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIFreqHyst', taskHandle, channel);
end
