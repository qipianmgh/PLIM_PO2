% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRealTimeWriteRecoveryMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRealTimeWriteRecoveryMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetRealTimeWriteRecoveryMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRealTimeWriteRecoveryMode', taskHandle, data);
end
