% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSampClkDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkDigSyncEnable', taskHandle, data);
end
