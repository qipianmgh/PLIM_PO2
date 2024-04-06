% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDIUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIUsbXferReqSize', taskHandle, channel, data);
end
