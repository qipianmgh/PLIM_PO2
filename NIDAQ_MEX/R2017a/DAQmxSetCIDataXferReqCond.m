% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIDataXferReqCond(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIDataXferReqCond', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIDataXferReqCond', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIDataXferReqCond', taskHandle, channel, data);
end
