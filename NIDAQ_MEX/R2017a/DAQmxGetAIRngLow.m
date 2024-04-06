% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRngLow(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRngLow', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRngLow', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRngLow', taskHandle, channel, data);
end
