% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteRelativeTo(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteRelativeTo', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWriteRelativeTo', taskHandle);
end
