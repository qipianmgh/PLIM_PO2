% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRVDTSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRVDTSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRVDTSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRVDTSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRVDTSensitivity', taskHandle, channel, data);
end
