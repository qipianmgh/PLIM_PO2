% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCODataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCODataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCODataXferReqCond', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCODataXferReqCond', taskHandle, channel, data);
end
