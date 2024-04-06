% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDIDataXferReqCond', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDataXferReqCond', taskHandle, channel, data);
end
