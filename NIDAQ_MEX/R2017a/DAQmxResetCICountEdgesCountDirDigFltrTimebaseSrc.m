% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc', taskHandle, channel);
end
