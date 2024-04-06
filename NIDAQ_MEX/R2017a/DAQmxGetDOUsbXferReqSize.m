% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOUsbXferReqSize', taskHandle, channel, data);
end
