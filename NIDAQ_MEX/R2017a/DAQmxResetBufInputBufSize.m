% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetBufInputBufSize(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetBufInputBufSize', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetBufInputBufSize', taskHandle);
end
