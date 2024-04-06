% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSyncPulseMinDelayToStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSyncPulseMinDelayToStart', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSyncPulseMinDelayToStart', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSyncPulseMinDelayToStart', taskHandle, data);
end
