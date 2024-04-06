% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetLoggingMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetLoggingMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetLoggingMode', taskHandle);
end
