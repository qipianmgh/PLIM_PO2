% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmstrR1(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmstrR1', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmstrR1', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIThrmstrR1', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmstrR1', taskHandle, channel, data);
end
