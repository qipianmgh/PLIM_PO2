% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeSensitivityUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIEddyCurrentProxProbeSensitivityUnits', taskHandle, channel, data);
end
