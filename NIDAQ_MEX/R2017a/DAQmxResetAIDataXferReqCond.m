% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIDataXferReqCond(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIDataXferReqCond', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIDataXferReqCond', taskHandle, channel);
end
