% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCODataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCODataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCODataXferReqCond', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCODataXferReqCond', taskHandle, channel, data);
end
