% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteSleepTime(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteSleepTime', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWriteSleepTime', taskHandle);
end
