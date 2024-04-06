% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIDigFltrEnableBusMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIDigFltrEnableBusMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIDigFltrEnableBusMode', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDIDigFltrEnableBusMode', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIDigFltrEnableBusMode', taskHandle, channel, data);
end
