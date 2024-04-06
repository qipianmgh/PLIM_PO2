% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc', taskHandle, channel, data);
end
