% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigSyncEnableEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvDigSyncEnableEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIConvDigSyncEnableEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigSyncEnableEx', taskHandle, deviceNames, data);
end
