% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTriggerSyncType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTriggerSyncType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetTriggerSyncType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetTriggerSyncType', taskHandle, data);
end
