% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDODataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDODataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDODataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDODataXferReqCond', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDODataXferReqCond', taskHandle, channel, data);
end
