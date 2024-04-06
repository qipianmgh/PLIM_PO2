% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAdvTrigOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAdvTrigOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAdvTrigOutputTerm', taskHandle);
end
