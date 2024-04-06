% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILVDTSensitivityUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILVDTSensitivityUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILVDTSensitivityUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAILVDTSensitivityUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILVDTSensitivityUnits', taskHandle, channel, data);
end
