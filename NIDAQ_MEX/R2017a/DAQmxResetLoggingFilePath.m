% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetLoggingFilePath(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetLoggingFilePath', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetLoggingFilePath', taskHandle);
end
