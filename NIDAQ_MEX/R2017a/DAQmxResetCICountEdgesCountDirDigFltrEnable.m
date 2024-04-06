% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesCountDirDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesCountDirDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesCountDirDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesCountDirDigFltrEnable', taskHandle, channel);
end
