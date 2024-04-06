% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIUsbXferReqSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIUsbXferReqSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIUsbXferReqSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIUsbXferReqSize', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIUsbXferReqSize', taskHandle, channel, data);
end
