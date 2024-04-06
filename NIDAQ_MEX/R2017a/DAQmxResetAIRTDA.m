% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRTDA(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRTDA', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRTDA', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRTDA', taskHandle, channel);
end
