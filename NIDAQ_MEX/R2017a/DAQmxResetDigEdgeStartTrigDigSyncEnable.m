% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeStartTrigDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeStartTrigDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeStartTrigDigSyncEnable', taskHandle);
end
