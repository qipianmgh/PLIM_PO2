% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOUsbXferReqSize', taskHandle, channel, data);
end
