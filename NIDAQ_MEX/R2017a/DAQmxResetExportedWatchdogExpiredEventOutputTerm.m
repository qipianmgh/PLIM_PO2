% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedWatchdogExpiredEventOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedWatchdogExpiredEventOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedWatchdogExpiredEventOutputTerm', taskHandle);
end
