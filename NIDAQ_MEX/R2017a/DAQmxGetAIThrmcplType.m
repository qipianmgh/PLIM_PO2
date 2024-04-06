% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIThrmcplType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIThrmcplType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIThrmcplType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIThrmcplType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIThrmcplType', taskHandle, channel, data);
end
