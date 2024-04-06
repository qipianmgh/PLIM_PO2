% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIDataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIDataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDIDataXferReqCond', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIDataXferReqCond', taskHandle, channel, data);
end
