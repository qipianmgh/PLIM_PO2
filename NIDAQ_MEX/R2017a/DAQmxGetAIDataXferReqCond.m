% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIDataXferReqCond', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIDataXferReqCond', taskHandle, channel, data);
end
