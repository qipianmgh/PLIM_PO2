% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadWaitMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadWaitMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadWaitMode', taskHandle);
end
