% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth', taskHandle, channel);
end
