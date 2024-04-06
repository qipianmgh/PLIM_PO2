% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIDataXferReqCond(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIDataXferReqCond', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIDataXferReqCond', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIDataXferReqCond', taskHandle, channel);
end
