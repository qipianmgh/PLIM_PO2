% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmcplCJCSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmcplCJCSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplCJCSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIThrmcplCJCSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmcplCJCSrc', taskHandle, channel, data);
end
