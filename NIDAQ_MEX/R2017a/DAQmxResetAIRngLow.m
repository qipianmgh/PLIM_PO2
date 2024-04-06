% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRngLow(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRngLow', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRngLow', taskHandle, channel);
end
