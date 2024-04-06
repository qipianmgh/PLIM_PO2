% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOUsbXferReqSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOUsbXferReqSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOUsbXferReqSize', taskHandle, channel);
end
