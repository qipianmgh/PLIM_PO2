% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILVDTSensitivity(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILVDTSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILVDTSensitivity', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILVDTSensitivity', taskHandle, channel);
end
