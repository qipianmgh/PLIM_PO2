% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIDataXferReqCond(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIDataXferReqCond', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIDataXferReqCond', taskHandle, channel);
end
