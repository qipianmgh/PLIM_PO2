% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIDigFltrEnableBusMode(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIDigFltrEnableBusMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIDigFltrEnableBusMode', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIDigFltrEnableBusMode', taskHandle, channel);
end
