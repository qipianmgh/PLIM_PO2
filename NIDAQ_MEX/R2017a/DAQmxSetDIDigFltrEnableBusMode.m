% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDigFltrEnableBusMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDigFltrEnableBusMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDigFltrEnableBusMode', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIDigFltrEnableBusMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDigFltrEnableBusMode', taskHandle, channel, data);
end
