% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeSensitivityUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIEddyCurrentProxProbeSensitivityUnits', taskHandle, channel, data);
end
