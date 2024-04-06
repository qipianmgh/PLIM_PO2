% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIFreqHyst(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIFreqHyst', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIFreqHyst', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIFreqHyst', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIFreqHyst', taskHandle, channel, data);
end
