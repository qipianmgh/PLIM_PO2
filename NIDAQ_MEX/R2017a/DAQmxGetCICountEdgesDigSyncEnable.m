% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICountEdgesDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICountEdgesDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICountEdgesDigSyncEnable', taskHandle, channel, data);
end
