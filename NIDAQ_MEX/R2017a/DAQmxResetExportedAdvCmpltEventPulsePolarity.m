% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAdvCmpltEventPulsePolarity(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAdvCmpltEventPulsePolarity', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAdvCmpltEventPulsePolarity', taskHandle);
end
