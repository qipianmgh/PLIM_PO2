% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRTDA(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRTDA', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRTDA', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRTDA', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRTDA', taskHandle, channel, data);
end
