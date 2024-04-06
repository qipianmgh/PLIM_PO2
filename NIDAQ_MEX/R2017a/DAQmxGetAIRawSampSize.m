% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRawSampSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRawSampSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRawSampSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIRawSampSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRawSampSize', taskHandle, channel, data);
end
