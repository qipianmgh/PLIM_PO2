% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseWidthDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseWidthDigFltrEnable', taskHandle, channel, data);
end
