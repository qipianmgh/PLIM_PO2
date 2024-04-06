% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDODataXferReqCond(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDODataXferReqCond', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDODataXferReqCond', taskHandle, channel);
end
