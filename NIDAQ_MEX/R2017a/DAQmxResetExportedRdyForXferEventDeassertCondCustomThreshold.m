% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold', taskHandle);
end
