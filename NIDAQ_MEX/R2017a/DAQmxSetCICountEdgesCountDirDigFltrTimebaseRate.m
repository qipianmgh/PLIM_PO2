% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate', taskHandle, channel, data);
end
