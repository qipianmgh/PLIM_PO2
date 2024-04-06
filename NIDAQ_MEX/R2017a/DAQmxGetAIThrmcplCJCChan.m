% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmcplCJCChan(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmcplCJCChan', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplCJCChan', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplCJCChan', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIThrmcplCJCChan', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmcplCJCChan', taskHandle, channel, data, bufferSize);
end
