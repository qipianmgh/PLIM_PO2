% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRVDTSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRVDTSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRVDTSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRVDTSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRVDTSensitivity', taskHandle, channel, data);
end
