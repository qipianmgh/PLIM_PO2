% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedRdyForStartEventOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedRdyForStartEventOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedRdyForStartEventOutputTerm', taskHandle);
end
