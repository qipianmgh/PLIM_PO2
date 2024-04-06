% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassCutoffFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassCutoffFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassCutoffFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAILowpassCutoffFreq', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassCutoffFreq', taskHandle, channel, data);
end
