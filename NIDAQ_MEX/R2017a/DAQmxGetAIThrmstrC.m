% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmstrC(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmstrC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmstrC', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIThrmstrC', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmstrC', taskHandle, channel, data);
end
