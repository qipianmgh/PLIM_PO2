% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRngHigh(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRngHigh', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRngHigh', taskHandle, channel);
end
