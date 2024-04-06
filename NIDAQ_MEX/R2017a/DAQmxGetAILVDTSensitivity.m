% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILVDTSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILVDTSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILVDTSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAILVDTSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILVDTSensitivity', taskHandle, channel, data);
end
