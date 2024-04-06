% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIMin', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIMin', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIMin', taskHandle, channel, data);
end
