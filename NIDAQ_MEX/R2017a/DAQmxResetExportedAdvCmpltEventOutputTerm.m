% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAdvCmpltEventOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAdvCmpltEventOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAdvCmpltEventOutputTerm', taskHandle);
end
