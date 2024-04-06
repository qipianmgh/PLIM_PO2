% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedSyncPulseEventOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedSyncPulseEventOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedSyncPulseEventOutputTerm', taskHandle);
end
