% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODataXferReqCond(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODataXferReqCond', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODataXferReqCond', taskHandle, channel);
end
