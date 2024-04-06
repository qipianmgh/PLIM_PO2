% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIACExcitFreq(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIACExcitFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIACExcitFreq', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIACExcitFreq', taskHandle, channel);
end
