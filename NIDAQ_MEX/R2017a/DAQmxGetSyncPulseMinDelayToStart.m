% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseMinDelayToStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseMinDelayToStart', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSyncPulseMinDelayToStart', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseMinDelayToStart', taskHandle, data);
end
