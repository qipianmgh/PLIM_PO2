% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmstrR1(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmstrR1', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmstrR1', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIThrmstrR1', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmstrR1', taskHandle, channel, data);
end
