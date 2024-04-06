% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIForceIEPESensorSensitivityUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIForceIEPESensorSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIForceIEPESensorSensitivityUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIForceIEPESensorSensitivityUnits', taskHandle, channel);
end
