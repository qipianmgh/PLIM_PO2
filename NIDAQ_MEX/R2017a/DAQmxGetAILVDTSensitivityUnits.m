% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILVDTSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILVDTSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILVDTSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAILVDTSensitivityUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILVDTSensitivityUnits', taskHandle, channel, data);
end
