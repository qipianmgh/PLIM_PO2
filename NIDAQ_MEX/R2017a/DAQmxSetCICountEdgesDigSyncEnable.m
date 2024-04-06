% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCICountEdgesDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICountEdgesDigSyncEnable', taskHandle, channel, data);
end
