% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseTimeDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTimeDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTimeDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPulseTimeDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseTimeDigSyncEnable', taskHandle, channel, data);
end
