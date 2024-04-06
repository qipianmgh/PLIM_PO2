% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmstrB(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmstrB', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmstrB', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIThrmstrB', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmstrB', taskHandle, channel, data);
end
