% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRVDTSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRVDTSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRVDTSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIRVDTSensitivityUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRVDTSensitivityUnits', taskHandle, channel, data);
end
