% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthDigFltrEnable', taskHandle, channel);
end
