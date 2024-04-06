% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigEdgeArmStartTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeArmStartTrigDigSyncEnable', taskHandle, data);
end
