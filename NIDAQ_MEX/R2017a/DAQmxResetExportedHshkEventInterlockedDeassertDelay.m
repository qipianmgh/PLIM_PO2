% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventInterlockedDeassertDelay(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventInterlockedDeassertDelay', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventInterlockedDeassertDelay', taskHandle);
end