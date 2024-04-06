% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventInterlockedAssertOnStart(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventInterlockedAssertOnStart', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventInterlockedAssertOnStart', taskHandle);
end
