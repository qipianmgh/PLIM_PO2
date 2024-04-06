% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIEddyCurrentProxProbeSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIEddyCurrentProxProbeSensitivityUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIEddyCurrentProxProbeSensitivityUnits', taskHandle, channel);
end
