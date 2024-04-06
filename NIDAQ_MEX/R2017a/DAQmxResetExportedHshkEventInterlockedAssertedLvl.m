% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventInterlockedAssertedLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventInterlockedAssertedLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventInterlockedAssertedLvl', taskHandle);
end
