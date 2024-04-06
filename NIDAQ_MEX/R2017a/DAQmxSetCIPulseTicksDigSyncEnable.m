% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTicksDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTicksDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPulseTicksDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseTicksDigSyncEnable', taskHandle, channel, data);
end
