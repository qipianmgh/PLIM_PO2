% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseWidthDigFltrTimebaseRate', taskHandle, channel, data);
end
