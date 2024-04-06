% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDigSyncEnable', taskHandle, channel, data);
end
