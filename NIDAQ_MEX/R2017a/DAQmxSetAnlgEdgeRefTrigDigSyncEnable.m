% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeRefTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeRefTrigDigSyncEnable', taskHandle, data);
end
