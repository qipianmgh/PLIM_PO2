% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAccelSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAccelSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAccelSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIAccelSensitivityUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAccelSensitivityUnits', taskHandle, channel, data);
end
