% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseResetTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseResetTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSyncPulseResetTime', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseResetTime', taskHandle, data);
end
