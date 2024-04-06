% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthDigFltrTimebaseSrc', taskHandle, channel);
end
