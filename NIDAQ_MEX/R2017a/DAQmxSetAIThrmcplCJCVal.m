% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmcplCJCVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmcplCJCVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmcplCJCVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIThrmcplCJCVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmcplCJCVal', taskHandle, channel, data);
end
