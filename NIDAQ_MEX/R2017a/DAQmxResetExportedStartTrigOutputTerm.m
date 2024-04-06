% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedStartTrigOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedStartTrigOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedStartTrigOutputTerm', taskHandle);
end
