% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmstrC(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmstrC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmstrC', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIThrmstrC', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmstrC', taskHandle, channel, data);
end
