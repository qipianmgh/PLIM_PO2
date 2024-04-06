% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseWidthDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseWidthDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPulseWidthDigFltrTimebaseSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPulseWidthDigFltrTimebaseSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseWidthDigFltrTimebaseSrc', taskHandle, channel, data, bufferSize);
end
