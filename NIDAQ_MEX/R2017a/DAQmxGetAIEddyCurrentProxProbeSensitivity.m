% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIEddyCurrentProxProbeSensitivity', taskHandle, channel, data);
end
