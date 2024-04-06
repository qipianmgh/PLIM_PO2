% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmstrA(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmstrA', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmstrA', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIThrmstrA', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmstrA', taskHandle, channel, data);
end
