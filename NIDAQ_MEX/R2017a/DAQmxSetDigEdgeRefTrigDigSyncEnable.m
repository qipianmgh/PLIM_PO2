% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeRefTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeRefTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigEdgeRefTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeRefTrigDigSyncEnable', taskHandle, data);
end
