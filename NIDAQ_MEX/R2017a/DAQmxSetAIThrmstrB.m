% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmstrB(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmstrB', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmstrB', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIThrmstrB', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmstrB', taskHandle, channel, data);
end
