% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRealTimeWriteRecoveryMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRealTimeWriteRecoveryMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRealTimeWriteRecoveryMode', taskHandle);
end
