% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetTriggerSyncType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetTriggerSyncType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetTriggerSyncType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetTriggerSyncType', taskHandle, data);
end
