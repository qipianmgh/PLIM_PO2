% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAcceldBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAcceldBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAcceldBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIAcceldBRef', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAcceldBRef', taskHandle, channel, data);
end
