% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIForceIEPESensorSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIForceIEPESensorSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIForceIEPESensorSensitivityUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIForceIEPESensorSensitivityUnits', taskHandle, channel, data);
end
