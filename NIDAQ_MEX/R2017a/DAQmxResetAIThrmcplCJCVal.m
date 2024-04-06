% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIThrmcplCJCVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIThrmcplCJCVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIThrmcplCJCVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIThrmcplCJCVal', taskHandle, channel);
end
