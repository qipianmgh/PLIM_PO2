% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRngHigh(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRngHigh', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRngHigh', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRngHigh', taskHandle, channel, data);
end
