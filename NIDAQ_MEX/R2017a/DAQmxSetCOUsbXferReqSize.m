% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOUsbXferReqSize', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOUsbXferReqSize', taskHandle, channel, data);
end
