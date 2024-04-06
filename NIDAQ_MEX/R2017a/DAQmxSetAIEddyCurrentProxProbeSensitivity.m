% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIEddyCurrentProxProbeSensitivity', taskHandle, channel, data);
end
