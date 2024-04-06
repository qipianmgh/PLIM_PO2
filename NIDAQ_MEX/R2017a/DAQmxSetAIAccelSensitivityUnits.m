% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAccelSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAccelSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAccelSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIAccelSensitivityUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAccelSensitivityUnits', taskHandle, channel, data);
end
