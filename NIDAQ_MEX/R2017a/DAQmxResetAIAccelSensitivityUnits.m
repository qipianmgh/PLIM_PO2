% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIAccelSensitivityUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIAccelSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIAccelSensitivityUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIAccelSensitivityUnits', taskHandle, channel);
end
