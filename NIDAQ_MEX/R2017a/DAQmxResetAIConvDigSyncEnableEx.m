% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigSyncEnableEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigSyncEnableEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvDigSyncEnableEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigSyncEnableEx', taskHandle, deviceNames);
end
