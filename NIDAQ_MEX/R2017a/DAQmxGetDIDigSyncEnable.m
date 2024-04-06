% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDIDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIDigSyncEnable', taskHandle, channel, data);
end
