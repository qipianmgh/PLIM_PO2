% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteWaitMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteWaitMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWriteWaitMode', taskHandle);
end
