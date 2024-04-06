% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIADCTimingMode(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIADCTimingMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIADCTimingMode', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIADCTimingMode', taskHandle, channel);
end
