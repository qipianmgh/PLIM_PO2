% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICountEdgesCountDirDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICountEdgesCountDirDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesCountDirDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICountEdgesCountDirDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICountEdgesCountDirDigFltrEnable', taskHandle, channel, data);
end
