% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmcplCJCVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmcplCJCVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplCJCVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIThrmcplCJCVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmcplCJCVal', taskHandle, channel, data);
end
