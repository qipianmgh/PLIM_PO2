% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAOUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOUsbXferReqSize', taskHandle, channel, data);
end
