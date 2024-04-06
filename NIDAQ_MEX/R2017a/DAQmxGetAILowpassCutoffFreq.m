% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILowpassCutoffFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILowpassCutoffFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILowpassCutoffFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAILowpassCutoffFreq', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILowpassCutoffFreq', taskHandle, channel, data);
end
