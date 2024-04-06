% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIUsbXferReqSize', taskHandle, channel, data);
end
