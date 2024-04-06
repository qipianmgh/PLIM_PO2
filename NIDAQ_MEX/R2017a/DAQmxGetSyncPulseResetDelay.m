% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseResetDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseResetDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSyncPulseResetDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseResetDelay', taskHandle, data);
end
