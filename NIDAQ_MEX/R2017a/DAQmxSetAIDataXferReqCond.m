% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIDataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIDataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIDataXferReqCond', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIDataXferReqCond', taskHandle, channel, data);
end
