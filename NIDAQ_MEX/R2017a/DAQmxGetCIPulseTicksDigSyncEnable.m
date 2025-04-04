% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseTicksDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseTicksDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIPulseTicksDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseTicksDigSyncEnable', taskHandle, channel, data);
end
