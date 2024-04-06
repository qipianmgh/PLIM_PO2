% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAdvCmpltEventPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAdvCmpltEventPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAdvCmpltEventPulseWidth', taskHandle);
end
