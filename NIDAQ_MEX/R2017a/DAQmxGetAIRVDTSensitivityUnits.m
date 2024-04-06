% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRVDTSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRVDTSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRVDTSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIRVDTSensitivityUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRVDTSensitivityUnits', taskHandle, channel, data);
end
