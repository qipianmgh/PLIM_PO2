% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigDigSyncEnable', taskHandle, data);
end
