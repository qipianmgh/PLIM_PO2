% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRTDR0(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRTDR0', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRTDR0', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRTDR0', taskHandle, channel);
end
