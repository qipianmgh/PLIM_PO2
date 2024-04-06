% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOUsbXferReqSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOUsbXferReqSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOUsbXferReqSize', taskHandle, channel);
end
