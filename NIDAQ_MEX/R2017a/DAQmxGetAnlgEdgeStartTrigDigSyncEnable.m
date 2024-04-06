% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigDigSyncEnable', taskHandle, data);
end
