% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedRdyForXferEventDeassertCond(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedRdyForXferEventDeassertCond', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedRdyForXferEventDeassertCond', taskHandle);
end
