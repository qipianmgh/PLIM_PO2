% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIUsbXferReqSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIUsbXferReqSize', taskHandle, channel, data);
end
