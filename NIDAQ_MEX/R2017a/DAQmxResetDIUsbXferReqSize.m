% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIUsbXferReqSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIUsbXferReqSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIUsbXferReqSize', taskHandle, channel);
end
