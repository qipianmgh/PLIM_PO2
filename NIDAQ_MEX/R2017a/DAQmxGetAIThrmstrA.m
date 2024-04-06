% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmstrA(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmstrA', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmstrA', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIThrmstrA', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmstrA', taskHandle, channel, data);
end
