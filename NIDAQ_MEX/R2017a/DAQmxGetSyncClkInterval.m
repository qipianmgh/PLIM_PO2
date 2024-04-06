% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncClkInterval(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncClkInterval', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSyncClkInterval', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSyncClkInterval', taskHandle, data);
end
