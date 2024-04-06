% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAODataXferReqCond', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODataXferReqCond', taskHandle, channel, data);
end
