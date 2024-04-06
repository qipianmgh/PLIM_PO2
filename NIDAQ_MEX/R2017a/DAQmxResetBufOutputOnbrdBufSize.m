% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetBufOutputOnbrdBufSize(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetBufOutputOnbrdBufSize', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetBufOutputOnbrdBufSize', taskHandle);
end
