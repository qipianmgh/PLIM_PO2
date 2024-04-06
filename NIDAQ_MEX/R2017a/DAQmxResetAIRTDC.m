% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRTDC(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRTDC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRTDC', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRTDC', taskHandle, channel);
end
