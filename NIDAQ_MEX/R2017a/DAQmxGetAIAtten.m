% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAtten(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAtten', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIAtten', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAtten', taskHandle, channel, data);
end
