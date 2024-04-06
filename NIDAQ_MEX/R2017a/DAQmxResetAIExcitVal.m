% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitVal', taskHandle, channel);
end
