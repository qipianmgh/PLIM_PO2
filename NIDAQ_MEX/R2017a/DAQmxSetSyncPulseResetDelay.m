% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSyncPulseResetDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSyncPulseResetDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSyncPulseResetDelay', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSyncPulseResetDelay', taskHandle, data);
end
