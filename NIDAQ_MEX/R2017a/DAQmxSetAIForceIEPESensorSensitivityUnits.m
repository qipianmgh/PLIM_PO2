% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIForceIEPESensorSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIForceIEPESensorSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIForceIEPESensorSensitivityUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIForceIEPESensorSensitivityUnits', taskHandle, channel, data);
end
