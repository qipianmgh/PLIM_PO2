% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSyncClkInterval(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSyncClkInterval', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSyncClkInterval', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSyncClkInterval', taskHandle, data);
end
