% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthDigFltrMinPulseWidth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthDigFltrMinPulseWidth', taskHandle, channel);
end
