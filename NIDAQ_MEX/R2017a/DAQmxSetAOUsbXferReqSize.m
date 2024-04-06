% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAOUsbXferReqSize', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOUsbXferReqSize', taskHandle, channel, data);
end
