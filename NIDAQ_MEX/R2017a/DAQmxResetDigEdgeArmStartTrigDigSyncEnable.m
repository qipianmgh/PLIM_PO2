% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeArmStartTrigDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeArmStartTrigDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeArmStartTrigDigSyncEnable', taskHandle);
end
