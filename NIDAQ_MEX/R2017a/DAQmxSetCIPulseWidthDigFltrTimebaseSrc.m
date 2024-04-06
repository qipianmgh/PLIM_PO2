% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPulseWidthDigFltrTimebaseSrc', taskHandle, channel, data);
end
