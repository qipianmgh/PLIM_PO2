% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIEddyCurrentProxProbeSensitivity(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIEddyCurrentProxProbeSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIEddyCurrentProxProbeSensitivity', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIEddyCurrentProxProbeSensitivity', taskHandle, channel);
end
