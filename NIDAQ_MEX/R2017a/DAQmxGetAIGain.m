% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIGain(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIGain', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIGain', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIGain', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIGain', taskHandle, channel, data);
end
