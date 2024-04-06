% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigSyncEnableEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvDigSyncEnableEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIConvDigSyncEnableEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigSyncEnableEx', taskHandle, deviceNames, data);
end
