% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedStartTrigPulsePolarity(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedStartTrigPulsePolarity', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedStartTrigPulsePolarity', taskHandle);
end
