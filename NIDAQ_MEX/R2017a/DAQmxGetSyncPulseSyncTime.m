% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseSyncTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseSyncTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSyncPulseSyncTime', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseSyncTime', taskHandle, data);
end
