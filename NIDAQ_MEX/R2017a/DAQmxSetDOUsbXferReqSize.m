% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOUsbXferReqSize', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOUsbXferReqSize', taskHandle, channel, data);
end
