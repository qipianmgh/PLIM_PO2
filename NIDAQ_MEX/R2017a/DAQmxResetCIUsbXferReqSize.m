% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIUsbXferReqSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIUsbXferReqSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIUsbXferReqSize', taskHandle, channel);
end
