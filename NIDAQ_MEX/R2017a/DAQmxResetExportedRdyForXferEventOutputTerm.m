% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedRdyForXferEventOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedRdyForXferEventOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedRdyForXferEventOutputTerm', taskHandle);
end
