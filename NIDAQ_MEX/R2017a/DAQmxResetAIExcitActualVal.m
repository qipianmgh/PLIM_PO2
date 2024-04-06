% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitActualVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitActualVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitActualVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitActualVal', taskHandle, channel);
end
