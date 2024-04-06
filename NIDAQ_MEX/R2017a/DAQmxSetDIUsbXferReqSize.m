% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIUsbXferReqSize', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIUsbXferReqSize', taskHandle, channel, data);
end
