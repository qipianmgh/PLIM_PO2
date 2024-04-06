% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICountEdgesCountDirDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICountEdgesCountDirDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesCountDirDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICountEdgesCountDirDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICountEdgesCountDirDigSyncEnable', taskHandle, channel, data);
end
