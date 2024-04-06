% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILVDTSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILVDTSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILVDTSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAILVDTSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILVDTSensitivity', taskHandle, channel, data);
end
