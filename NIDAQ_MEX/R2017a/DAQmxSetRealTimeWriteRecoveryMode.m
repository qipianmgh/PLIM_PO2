% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRealTimeWriteRecoveryMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRealTimeWriteRecoveryMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetRealTimeWriteRecoveryMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRealTimeWriteRecoveryMode', taskHandle, data);
end
