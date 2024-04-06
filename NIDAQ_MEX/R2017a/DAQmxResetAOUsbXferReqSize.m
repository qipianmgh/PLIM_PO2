% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOUsbXferReqSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOUsbXferReqSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOUsbXferReqSize', taskHandle, channel);
end
