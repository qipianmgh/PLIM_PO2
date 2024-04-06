% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseWidthDigFltrMinPulseWidth', taskHandle, channel, data);
end
